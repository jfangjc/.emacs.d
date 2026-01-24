;; (unless (package-installed-p 'atom-one-dark-theme)
;;   (package-install 'atom-one-dark-theme))
(use-package nano-theme
  :vc (:url "https://github.com/rougier/nano-theme.git"))
(load-theme 'nano-light t)

(provide 'init-theme)
