;;(unless (package-installed-p 'material-theme)
;;  (package-install 'material-theme))
;; 
;;(load-theme 'material-light t)

;;(unless (package-installed-p 'catppuccin-theme)
;;  (package-install 'catppuccin-theme))
;; 
;;(load-theme 'catppuccin t)
;;
;;(setq catppuccin-flavor 'latte) ;; or 'latte, 'macchiato, or 'mocha
;;(catppuccin-reload)

(unless (package-installed-p 'apropospriate-theme)
  (package-install 'apropospriate-theme))

;;(require 'apropospriate)
(load-theme 'apropospriate-light t)

(provide 'init-theme)
