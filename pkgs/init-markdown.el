;; (unless (package-installed-p 'markdown-mode)
;;   (package-install 'markdown-mode))
;; 
;; (setq markdown-enable-math t)
;; (setq markdown-split-window-direction 'right)
;; 
;; (autoload 'markdown-mode "markdown-mode" t)
;; (add-to-list 'auto-mode-alist
;;              '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))
;; 
;; (autoload 'gfm-mode "markdown-mode"
;;    "Major mode for editing GitHub Flavored Markdown files" t)
;; (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;; 
;; (with-eval-after-load 'markdown-mode
;;   (define-key markdown-mode-map (kbd "C-c C-e") #'markdown-do))

(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  ;; Make the buffer visually more like Org.
  (setq-default markdown-hide-markup t)
  :custom
  (markdown-header-scaling t)
  (markdown-fontify-code-blocks-natively t)
  (markdown-special-ctrl-a/e t)
  :hook
  ((markdown-mode . visual-line-mode)
   (gfm-mode . visual-line-mode)))

(provide 'init-markdown)
