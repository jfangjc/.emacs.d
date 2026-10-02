;;; early-init.el --- Emacs 27+ pre-initialisation config

;;; Commentary:

;; Emacs 27+ loads this file before activating packages.  Enable cached
;; package activation and raise the garbage collection threshold temporarily.

;;; Code:

(setq package-enable-at-startup t
      package-quickstart t)

(let ((startup-gc-threshold gc-cons-threshold))
  (setq gc-cons-threshold (* 64 1024 1024))
  (add-hook 'emacs-startup-hook
            `(lambda ()
               (setq gc-cons-threshold ,startup-gc-threshold))))

;; So we can detect this having been loaded
(provide 'early-init)

;;; early-init.el ends here
