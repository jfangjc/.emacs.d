(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(setq evil-want-C-u-scroll t)
(setq evil-undo-system 'undo-redo)
(setq evil-search-module 'evil-search)
(setq evil-want-keybinding nil)
(setq evil-want-integration t)
(setq evil-respect-visual-line-mode t)

(require 'evil)

(evil-mode 1)

(with-eval-after-load 'ibuffer
  (evil-define-key 'normal my/pin-mode-map
    (kbd "<escape>") #'my/pin-quit
    (kbd "q") #'my/pin-quit
    (kbd "RET") #'my/pin-visit-buffer
    (kbd "<return>") #'my/pin-visit-buffer))

(define-key evil-insert-state-map (kbd "C-j") nil)
(define-key evil-insert-state-map (kbd "C-k") nil)

(define-key evil-normal-state-map (kbd "C-j") #'my/pin-next-file)
(define-key evil-normal-state-map (kbd "C-k") #'my/pin-previous-file)

(define-key evil-normal-state-map (kbd "C-p") nil)
(define-key evil-motion-state-map (kbd "SPC") nil)
(define-key evil-normal-state-map (kbd "C-r") evil-redo-function)

(define-key evil-motion-state-map (kbd "C-f") nil)

(define-key evil-normal-state-map (kbd "C-d")
  (lambda ()
    (interactive)
    (evil-scroll-down 0)
    (evil-scroll-line-to-center (line-number-at-pos))))

(global-set-key [remap evil-quit] 'kill-buffer-and-window)

(setq evil-collection-setup-minibuffer t)

(setq evil-collection-key-blacklist '("C-j" "C-k" "C-f" "SPC"))

(evil-collection-init '(dired magit ibuffer vertico company))

(provide 'init-evil)
