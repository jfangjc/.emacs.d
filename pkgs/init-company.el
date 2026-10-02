(unless (package-installed-p 'company)
  (package-install 'company))

(with-eval-after-load 'company
    (define-key company-active-map (kbd "C-j") 'company-select-next)
    (define-key company-active-map (kbd "C-k") 'company-select-previous)
    (define-key company-active-map (kbd "C-u") 'company-previous-page)
    (define-key company-active-map (kbd "C-d") 'company-next-page)
    (define-key company-active-map [escape] 'company-abort)
    (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
    (define-key company-active-map (kbd "<ret>") nil))

(setq company-require-match nil)

(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'text-mode-hook #'company-mode)

(provide 'init-company)
