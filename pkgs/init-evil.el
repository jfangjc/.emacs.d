(unless (package-installed-p 'evil)
  (package-install 'evil))

;; C-u zz
(defadvice evil-scroll-up
      (after advice-for-evil-scroll-up activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

;; C-d zz
(defadvice evil-scroll-down
      (after advice-for-evil-scroll-down activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode 1)

(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))
(define-key evil-insert-state-map (kbd "C-j") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)

(define-key evil-normal-state-map (kbd "C-p") nil)

(define-key evil-motion-state-map (kbd "C-f") nil)

(provide 'init-evil)
