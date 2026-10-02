(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'load-path (expand-file-name "pkgs" user-emacs-directory))

(require 'init-evil)
(require 'init-markdown)
(require 'init-projectile)
(require 'init-eglot)
(require 'init-company)
(require 'init-ibuffer)
(require 'init-vertico)
(require 'init-term)
(require 'init-general)
(require 'init-auctex)
(require 'init-git)
;; (require 'init-ultrascroll)

(require 'init-theme)
;; (require 'init-modeline)

(set-face-background 'header-line (face-foreground 'default nil 'default))
(set-face-foreground 'header-line (face-background 'default nil 'default))

(setq-default header-line-format mode-line-format)
(setq-default mode-line-format nil)

(set-face-attribute 'header-line nil :box nil)

(set-default-coding-systems 'utf-8)

(setq initial-major-mode 'fundamental-mode)

(setq inhibit-startup-screen t)

(setq initial-buffer-choice (expand-file-name "."))

(setq-default message-log-max nil)
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

;; (set-frame-parameter (selected-frame) 'alpha '(95 95))
;; (add-to-list 'default-frame-alist '(alpha 95 95))
(set-frame-parameter nil 'alpha-background 75)
(add-to-list 'default-frame-alist '(alpha-background . 75))
(add-to-list 'default-frame-alist '(undecorated . t))

(setq frame-resize-pixelwise t)

(setq x-pointer-shape nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(column-number-mode t)
(line-number-mode t)
(blink-cursor-mode -1)
(global-auto-revert-mode 1)

(setq visible-cursor nil)
(setq cursor-in-non-selected-windows nil)

(setq dired-kill-when-opening-new-dired-buffer t)

(setq ring-bell-function 'ignore)

(setq make-backup-files nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono Nerd Font" :slant normal :weight semi-bold :height 120 :width normal)))))

;; maximized on launch
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-hl-line-mode +1)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-d") 'dired)

(eval-after-load "org" '(progn(define-key org-mode-map (kbd "C-j") 'nil)))

(global-set-key (kbd "C-k") 'nil)
(global-set-key (kbd "C-j") 'nil)

(global-set-key (kbd "C-k") 'previous-buffer)
(global-set-key (kbd "C-j") 'next-buffer)

(global-set-key (kbd "C-p") 'nil)
(global-set-key (kbd "C-p") 'execute-extended-command)

(global-set-key (kbd "C-o") 'nil)
(global-set-key (kbd "C-p") 'execute-extended-command)

(global-set-key (kbd "C-e") 'nil)
(global-set-key (kbd "C-p") 'execute-extended-command)

;; (global-set-key (kbd "C-/") 'nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(atom-one-dark-theme auctex autothemer catppuccin-theme company
                         diff-hl dracula-theme evil-collection general
                         isar-mode markdown-mode modus-themes
                         nano-theme nix-mode orderless oxocarbon-emacs
                         projectile tokyo-night ultra-scroll vertico))
 '(package-vc-selected-packages
   '((tokyo-night :url
                  "https://github.com/rawleyfowler/tokyo-theme.el.git")
     (isar-mode :url "https://github.com/m-fleury/isar-mode.git")
     (rose-pine-emacs :url
                      "https://github.com/thongpv87/rose-pine-emacs.git"))))

(defun q ()
  (interactive)
  (save-buffers-kill-terminal))
