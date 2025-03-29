(unless (package-installed-p 'general)
  (package-install 'general))

(require 'general)

(general-create-definer my-leader-def
  :prefix "SPC")

(my-leader-def
  :keymaps 'normal
  "f" 'projectile-find-file)
(my-leader-def
  :keymaps 'normal
  "b" 'ibuffer)
(my-leader-def
  :keymaps 'normal
  "d" 'dired)

(provide 'init-general)
