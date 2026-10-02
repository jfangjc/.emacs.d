(defun my/diff-hl-dired-highlight (overlay type shape)
  (if (eq type 'ignored)
      (save-excursion
        (dired-move-to-filename)
        (let ((start (point)))
          (dired-move-to-end-of-filename)
          (move-overlay overlay start (point)))
        (overlay-put overlay 'face 'font-lock-comment-face))
    (diff-hl-highlight-on-margin overlay type shape)))

(defun my/diff-hl-dired-use-status-letters ()
  (require 'diff-hl-margin)
  (setq-local diff-hl-highlight-function #'my/diff-hl-dired-highlight
              diff-hl-margin-symbols-alist
              '((insert . "A") (delete . "D") (change . "M")
                (unknown . "U") (ignored . " ") (reference . " "))
              diff-hl-margin-spec-cache nil))

(use-package diff-hl
  :ensure t
  :hook ((dired-mode . diff-hl-dired-mode)
         (diff-hl-dired-mode-on . my/diff-hl-dired-use-status-letters))
  :custom-face
  (diff-hl-delete ((t (:foreground "#FF3344" :background "#FF3344"))))
  (diff-hl-insert ((t (:foreground "#00E676" :background "#00E676"))))
  (diff-hl-change ((t (:foreground "#3399FF" :background "#3399FF"))))
  (diff-hl-dired-delete ((t (:inherit diff-hl-delete))))
  (diff-hl-dired-insert ((t (:inherit diff-hl-insert))))
  (diff-hl-dired-change ((t (:inherit diff-hl-change))))

  (diff-hl-margin-delete ((t (:inherit default :foreground "#FF3344" :weight bold))))
  (diff-hl-margin-insert ((t (:inherit default :foreground "#00E676" :weight bold))))
  (diff-hl-margin-change ((t (:inherit default :foreground "#3399FF" :weight bold))))
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1))

(provide 'init-git)
