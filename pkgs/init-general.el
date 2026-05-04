(unless (package-installed-p 'general)
  (package-install 'general))

(require 'general)

(general-create-definer leader-def
  :prefix "SPC")

(defun my/find-file-dwim ()
  (interactive)
  (if (projectile-project-p)
      (call-interactively #'projectile-find-file)
    (call-interactively #'find-file)))

(defun my/ibuffer-dwim ()
  (interactive)
  (if (projectile-project-p)
      (call-interactively #'projectile-ibuffer)
    (call-interactively #'ibuffer)))

(defun my/dired-dwim ()
  (interactive)
  (if (projectile-project-p)
      (call-interactively #'projectile-dired)
    (call-interactively #'dired)))

(leader-def
  :keymaps 'normal
  "f" #'my/find-file-dwim
  "b" #'my/ibuffer-dwim
  "d" #'my/dired-dwim
  "p" #'projectile-switch-project
  "a" #'my/pin-add-file
  "s" #'my/pin-toggle)

(general-define-key
 :keymaps '(normal insert emacs)
 "C-j" #'my/pin-next-file
 "C-k" #'my/pin-previous-file)

(provide 'init-general)
