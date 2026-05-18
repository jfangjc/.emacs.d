(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)

(require 'projectile)

(setq projectile-require-project-root nil
      projectile-known-projects-file
      (expand-file-name "projectile-bookmarks.eld" user-emacs-directory)
      projectile-track-known-projects-automatically t
      projectile-completion-system 'default)

(defun my/projectile-add-known-directory (dir)
  (interactive "DDirectory: ")
  (let ((dir (file-name-as-directory (expand-file-name dir))))
    (unless (file-directory-p dir)
      (user-error "Not a directory: %s" dir))
    (projectile-add-known-project dir)
    (projectile-save-known-projects)
    (message "Added known Projectile directory: %s" dir)))

(defun my/projectile-switch-known-directory ()
  (interactive)
  (projectile-load-known-projects)
  (let* ((projects projectile-known-projects)
         (project (completing-read "Switch to directory: " projects nil t)))
    (unless (file-directory-p project)
      (user-error "Directory does not exist: %s" project))
    (dired project)))

(defalias 'projectile-add-known-directory
  #'my/projectile-add-known-directory)

(defalias 'projectile-switch-known-directory
  #'my/projectile-switch-known-directory)

(projectile-mode +1)

(provide 'init-projectile)
