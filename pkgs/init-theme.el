(unless (package-installed-p 'atom-one-dark-theme)
  (package-install 'atom-one-dark-theme))
(load-theme 'atom-one-dark t)

(provide 'init-theme)
