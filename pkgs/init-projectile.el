(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)

(setq projectile-switch-project-action 'projectile-dired)

(require 'projectile)

(define-key projectile-mode-map (kbd "C-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-p C-d") 'projectile-dired)
(define-key projectile-mode-map (kbd "C-p C-b") 'projectile-ibuffer)
(define-key projectile-mode-map (kbd "C-o") 'projectile-find-file)

(projectile-mode +1)

(provide 'init-projectile)
