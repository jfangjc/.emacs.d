;; (unless (package-installed-p 'atom-one-dark-theme)
;;   (package-install 'atom-one-dark-theme))
;; (use-package nano-theme
;;   :vc (:url "https://github.com/rougier/nano-theme.git"))
;; (load-theme 'nano-light t)

(use-package autothemer
    :ensure t)

(use-package oxocarbon-emacs
    :vc (:url "https://github.com/konrad1977/oxocarbon-emacs.git")
    :no-require t
    :after autothemer
    :config
    (load-theme 'oxocarbon t))

(provide 'init-theme)
