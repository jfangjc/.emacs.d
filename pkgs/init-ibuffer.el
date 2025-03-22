(with-eval-after-load 'ibuffer

  ;; Use human readable Size column instead of original one
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
        (quote (("default"
                 ("C" (mode . c-mode))
                 ("Emacs" (or (mode . emacs-lisp-mode)
                              (mode . lisp-mode)))
                 ("Markdown" (mode . markdown-mode))
                 ("Dired" (or (mode . dired-mode)
                              (mode . sr-mode)))
                 ("Other" (or (name . "^\\*scratch\\*$")
                              (name . "^\\*Messages\\*$")))))))
  (defun ibuffer-mode-hook-setup ()
    (ibuffer-switch-to-saved-filter-groups "default"))

  (add-hook 'ibuffer-mode-hook 'ibuffer-mode-hook-setup)

  ;; Modify the default ibuffer-formats
  (setq ibuffer-formats
        '((mark modified read-only " "
                (name 18 18 :left :elide)
                " "
                (size-h 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " "
                filename-and-process)))

  (setq ibuffer-filter-group-name-face 'font-lock-doc-face))

(provide 'init-ibuffer)
