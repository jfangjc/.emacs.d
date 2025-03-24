(unless (package-installed-p 'general)
  (package-install 'general))

(require 'general)

(general-create-definer my-leader-def
  :prefix "SPC")

(my-leader-def
  :keymaps 'normal
  "f" 'dired)

(provide 'init-general)
