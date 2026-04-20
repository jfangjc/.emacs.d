(unless (package-installed-p 'general)
  (package-install 'general))

(require 'general)

(general-create-definer leader-def
  :prefix "SPC")

(if (projectile-project-p)
    (leader-def
        :keymaps 'normal
        "f" 'projectile-find-file)
    (leader-def
        :keymaps 'normal
        "b" 'projectile-ibuffer)
    (leader-def
        :keymaps 'normal
        "d" 'projectile-dired)
 
(leader-def
    :keymaps 'normal
    "f" 'find-file)
(leader-def
    :keymaps 'normal
    "b" 'ibuffer)
(leader-def
    :keymaps 'normal
    "d" 'dired)
)

(leader-def
    :keymaps 'normal
    "p" 'projectile-switch-project)

(provide 'init-general)
