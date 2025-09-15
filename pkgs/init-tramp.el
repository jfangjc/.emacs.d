(require 'tramp)

(when (eq system-type 'windows-nt)
  ;; Get the tramp-methods variable populated
  (require 'tramp)
  ;; Add the '-tt' flag to the login arguments for "ssh" ONLY
  (push '("-tt")
        (cadr (assoc 'tramp-login-args
                     (assoc "ssh" tramp-methods)))))

(setq tramp-use-ssh-controlmaster-options nil)
(setq tramp-default-method "ssh")

(provide 'init-tramp)
