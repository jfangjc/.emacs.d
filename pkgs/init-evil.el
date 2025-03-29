(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

;; C-u zz
(defadvice evil-scroll-up
      (after advice-for-evil-scroll-up activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

;; C-d zz
(defadvice evil-scroll-down
      (after advice-for-evil-scroll-down activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

(setq evil-want-C-u-scroll t)
(setq evil-undo-system 'undo-redo)
(setq evil-search-module 'evil-search)
(setq evil-want-keybinding nil)
(setq evil-want-integration t)

(require 'evil)

(evil-mode 1)

(define-key evil-insert-state-map (kbd "C-j") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)

(define-key evil-normal-state-map (kbd "C-p") nil)
(define-key evil-motion-state-map (kbd "SPC") nil)
(define-key evil-normal-state-map (kbd "C-r") evil-redo-function)

(define-key evil-motion-state-map (kbd "C-f") nil)

(global-set-key [remap evil-quit] 'kill-buffer-and-window)

(setq evil-collection-setup-minibuffer t)

(setq evil-collection-key-blacklist '("C-j" "C-k" "C-f" "SPC"))

(evil-collection-init '(dired magit ibuffer vertico company))

(provide 'init-evil)
