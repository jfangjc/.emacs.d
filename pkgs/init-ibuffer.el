(with-eval-after-load 'ibuffer
  (require 'cl-lib)
  (require 'seq)

  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (cond
     ((> (buffer-size) 1000000)
      (format "%7.1fM" (/ (buffer-size) 1000000.0)))
     ((> (buffer-size) 1000)
      (format "%7.1fk" (/ (buffer-size) 1000.0)))
     (t
      (format "%8d" (buffer-size)))))

  (setq ibuffer-expert t
        ibuffer-show-empty-filter-groups nil
        ibuffer-use-other-window nil
        ibuffer-display-summary nil)

  (setq ibuffer-saved-filter-groups
        '(("default"
           ("C" (mode . c-mode))
           ("Emacs" (or (mode . emacs-lisp-mode)
                        (mode . lisp-mode)))
           ("Markdown" (mode . markdown-mode))
           ("Dired" (or (mode . dired-mode)
                        (mode . sr-mode)))
           ("Other" (or (name . "^\\*scratch\\*$")
                        (name . "^\\*Messages\\*$"))))))

  (defun my/ibuffer-mode-setup ()
    (unless (string= (buffer-name) "*pin*")
      (ibuffer-switch-to-saved-filter-groups "default")))

  (add-hook 'ibuffer-mode-hook #'my/ibuffer-mode-setup)

  (setq ibuffer-formats
        '((mark modified read-only " "
                (name 18 18 :left :elide)
                " "
                (size-h 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " "
                filename-and-process)))

  (setq ibuffer-filter-group-name-face 'font-lock-doc-face)

  (defvar my/pin-files nil
    "Ordered list of pinned file names.")

  (defvar my/pin-source-window nil
    "Window from which the pin popup was opened.")

  (defun my/pin--current-file ()
    "Return normalized file name for current buffer, or nil."
    (when buffer-file-name
      (file-truename buffer-file-name)))

  (defun my/pin--live-files ()
    "Keep only pinned files that still exist or are currently visited."
    (setq my/pin-files
          (seq-filter
           (lambda (file)
             (or (file-exists-p file)
                 (get-file-buffer file)))
           my/pin-files)))

  (defun my/pin--buffer-for-file (file)
    "Return a live buffer visiting FILE, opening it if needed."
    (or (get-file-buffer file)
        (find-file-noselect file)))

  (defun my/pin--goto-file-or-first (file)
    "Move point to FILE in the current ibuffer, or the first file row."
    (let ((first-file-point nil)
          (target-point nil))
      (goto-char (point-min))
      (while (and (not target-point)
                  (not (eobp))
                  (not (get-text-property (point) 'ibuffer-summary)))
        (let ((row-point (point))
              (buf (ibuffer-current-buffer)))
          (when (buffer-live-p buf)
            (with-current-buffer buf
              (when buffer-file-name
                (unless first-file-point
                  (setq first-file-point row-point))
                (when (and file
                           (equal (file-truename buffer-file-name) file))
                  (setq target-point row-point))))))
        (forward-line 1))
      (goto-char (or target-point first-file-point (point-min)))
      (point)))

  (defun my/pin-add-file ()
    "Add current file to pin."
    (interactive)
    (let ((file (my/pin--current-file)))
      (unless file
        (user-error "Current buffer is not visiting a file"))
      (unless (member file (my/pin--live-files))
        (setq my/pin-files
              (append my/pin-files (list file))))
      (message "pin added: %s" (abbreviate-file-name file))
      (when (get-buffer "*pin*")
        (with-current-buffer "*pin*"
          (ibuffer-update nil t)
          (let ((pos (my/pin--goto-file-or-first file))
                (win (get-buffer-window (current-buffer) t)))
            (when (window-live-p win)
              (set-window-point win pos)))))))

  (defun my/pin-next-file ()
    "Switch to next pined file."
    (interactive)
    (let* ((files (my/pin--live-files))
           (len (length files))
           (current (my/pin--current-file))
           (pos (cl-position current files :test #'equal)))
      (cond
       ((zerop len)
        (user-error "Pin is empty"))
       ((null pos)
        (switch-to-buffer (my/pin--buffer-for-file (car files))))
       (t
        (switch-to-buffer
         (my/pin--buffer-for-file
          (nth (mod (1+ pos) len) files)))))))

  (defun my/pin-previous-file ()
    "Switch to previous pined file."
    (interactive)
    (let* ((files (my/pin--live-files))
           (len (length files))
           (current (my/pin--current-file))
           (pos (cl-position current files :test #'equal)))
      (cond
       ((zerop len)
        (user-error "Pin is empty"))
       ((null pos)
        (switch-to-buffer (my/pin--buffer-for-file (car files))))
       (t
        (switch-to-buffer
         (my/pin--buffer-for-file
          (nth (mod (1- pos) len) files)))))))

  (define-ibuffer-filter pin
      "Show only buffers visiting pined files."
    (:description "pin")
    (let ((file (and (buffer-file-name buf)
                     (file-truename (buffer-file-name buf)))))
      (and file
           (member file (my/pin--live-files)))))

  (define-derived-mode my/pin-mode ibuffer-mode "pin"
    "Ibuffer-based popup for pined files.")

  (defun my/pin-quit ()
    "Close the *pin* popup."
    (interactive)
    (quit-window t))

  (defun my/pin-visit-buffer ()
    "Open the buffer at point in the window that opened pin."
    (interactive)
    (let* ((buf (ibuffer-current-buffer t))
           (source-win (and (window-live-p my/pin-source-window)
                            my/pin-source-window)))
      (unless buf
        (user-error "No buffer on this line"))
      (my/pin-quit)
      (cond
       (source-win
        (select-window source-win)
        (switch-to-buffer buf))
       (t
        (switch-to-buffer buf)))))

  (defun my/pin-open ()
    "Open pin buffer list."
    (interactive)
    (setq my/pin-source-window (selected-window))
    (let ((buf (get-buffer-create "*pin*"))
          (file (my/pin--current-file))
          pos)
      (with-current-buffer buf
        (my/pin-mode)
        (rename-buffer "*pin*" t)
        (setq-local ibuffer-filter-groups nil)
        (setq-local ibuffer-hidden-filter-groups nil)
        (ibuffer-filter-disable)
        (ibuffer-push-filter '(pin))
        (define-key my/pin-mode-map (kbd "RET") #'my/pin-visit-buffer)
        (define-key my/pin-mode-map (kbd "<return>") #'my/pin-visit-buffer)
        (ibuffer-update nil t)
        (setq pos (my/pin--goto-file-or-first file)))
      (pop-to-buffer buf)
      (set-window-point (selected-window) pos)))

  (defun my/pin-toggle ()
    "Toggle pin buffer list."
    (interactive)
    (if (get-buffer-window "*pin*")
        (delete-window (get-buffer-window "*pin*"))
      (my/pin-open)))

  ;; Remove file from pin when deleted from *pin*
  (defun my/pin-remove-marked-files ()
    "Remove files corresponding to marked buffers from pin."
    (when (derived-mode-p 'ibuffer-mode)
      (let ((files-to-remove nil))
        (dolist (buf (ibuffer-get-marked-buffers))
          (with-current-buffer buf
            (when buffer-file-name
              (push (file-truename buffer-file-name) files-to-remove))))
        (setq my/pin-files
              (seq-remove
               (lambda (file) (member file files-to-remove))
               my/pin-files)))))

  (defun my/pin-prune-after-ibuffer-operation (&rest _)
    (my/pin--live-files)
    (when (get-buffer "*pin*")
      (with-current-buffer "*pin*"
        (ibuffer-update nil t))))

  ;; On D / x workflow, remove corresponding pinned files too
  (advice-add 'ibuffer-do-kill-on-deletion-marks :before #'my/pin-remove-marked-files)
  (advice-add 'ibuffer-do-kill-on-deletion-marks :after #'my/pin-prune-after-ibuffer-operation))

(provide 'init-ibuffer)
