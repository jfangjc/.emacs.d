(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)

(require 'projectile)

(define-key projectile-mode-map (kbd "C-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-f") 'projectile-find-file)

(projectile-mode +1)

(provide 'init-projectile)
