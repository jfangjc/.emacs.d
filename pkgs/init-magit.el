(unless (package-installed-p 'magit)
  (package-install 'magit))

(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

(provide 'init-magit)
