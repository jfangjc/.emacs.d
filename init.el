(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
;;(package-refresh-contents)

(load-theme 'dracula t)

(add-to-list 'load-path (expand-file-name "pkgs" user-emacs-directory))

(require 'init-evil)
(require 'init-markdown)
(require 'init-projectile)
(require 'init-eglot)
(require 'init-company)
(require 'init-tramp)
(require 'init-modeline)
(require 'init-ibuffer)
(require 'init-vertico)
(require 'init-term)

(setq inhibit-startup-screen t)

(setq initial-scratch-message "")
(setq initial-major-mode 'fundamental-mode)

(setq-default display-line-numbers 'relative)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq-default c-basic-offset 4)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(column-number-mode t)
(line-number-mode t)

(setq dired-kill-when-opening-new-dired-buffer t)

(setq ring-bell-function 'ignore)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cascadia Code" :foundry "outline" :slant normal :weight regular :height 161 :width normal)))))

;; maximized on launch
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-hl-line-mode +1)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-d") 'dired)

(global-set-key (kbd "C-h") 'previous-buffer)
(global-set-key (kbd "C-l") 'next-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company dracula-theme evil markdown-mode projectile vertico)))
