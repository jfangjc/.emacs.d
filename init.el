(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(add-to-list 'load-path (expand-file-name "pkgs" user-emacs-directory))

(require 'init-evil)
(require 'init-markdown)
(require 'init-projectile)
(require 'init-eglot)
(require 'init-company)
(require 'init-tramp)
(require 'init-ibuffer)
(require 'init-vertico)
(require 'init-term)
(require 'init-general)

(require 'init-theme)
(require 'init-modeline)

(when (eq system-type 'windows-nt)
  (prefer-coding-system 'utf-8-unix))
(set-default-coding-systems 'utf-8)

;;(setq initial-major-mode 'fundamental-mode)

(setq inhibit-startup-screen t)

(setq initial-buffer-choice (expand-file-name "."))

;;(setq-default message-log-max nil)
(setq initial-scratch-message "")

(add-hook 'emacs-startup-hook (lambda ()
                              (when (get-buffer "*scratch*")
                                (kill-buffer "*scratch*"))
                              (when (get-buffer "*Messages*")
                                (kill-buffer "*Messages*"))))

(global-visual-line-mode 1)

(setq-default display-line-numbers 'visual)

(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

(set-frame-parameter (selected-frame) 'alpha '(97 97))
(add-to-list 'default-frame-alist '(alpha 97 97))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(column-number-mode t)
(line-number-mode t)

(setq dired-kill-when-opening-new-dired-buffer t)

(setq ring-bell-function 'ignore)

(setq make-backup-files nil) 

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

(eval-after-load "org" '(progn
(define-key org-mode-map    (kbd "C-j") 'nil))  )

(global-set-key (kbd "C-k") 'nil)
(global-set-key (kbd "C-j") 'nil)
    
(global-set-key (kbd "C-k") 'previous-buffer)
(global-set-key (kbd "C-j") 'next-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
    '(apropospriate-theme atom-one-dark-theme company evil-collection
                          general markdown-mode projectile vertico)))

