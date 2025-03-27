(unless (package-installed-p 'material-theme)
  (package-install 'material-theme))

(load-theme 'material-light t)

(provide 'init-theme)
