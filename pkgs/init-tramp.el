(require 'tramp)

;; (when (eq system-type 'windows-nt)
;;   (require 'tramp)
;;   (push '("-tt")
;;         (cadr (assoc 'tramp-login-args
;;                      (assoc "ssh" tramp-methods)))))
;; 
;; (when (eq system-type 'windows-nt)
;;   (prefer-coding-system 'utf-8-unix))

;; (when (eq system-type 'windows-nt)
;;   (require 'cl-lib)
;;   (with-eval-after-load 'tramp
;;     (cl-pushnew '("-tt")
;;                 (car (alist-get 'tramp-login-args
;;                                 (cdr (assoc "ssh" tramp-methods))))
;;                 :test #'equal)))

;; (when (eq system-type 'windows-nt)
;;   (setq tramp-use-ssh-controlmaster-options nil)
;;   (add-to-list 'tramp-connection-properties
;;                (list (regexp-quote "/ssh:")
;;                      "login-args"
;;                      '(("-tt") ("-l" "%u") ("-p" "%p") ("%c")
;;                        ("-e" "none") ("%h")))))

(provide 'init-tramp)
