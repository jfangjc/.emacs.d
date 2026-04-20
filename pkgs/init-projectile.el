(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)

(setq projectile-switch-project-action 'projectile-dired)

(require 'projectile)

(projectile-mode +1)

(provide 'init-projectile)
