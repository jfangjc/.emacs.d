(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

(setq markdown-enable-math t)
(setq markdown-split-window-direction 'right)

(autoload 'markdown-mode "markdown-mode" t)
(add-to-list 'auto-mode-alist
             '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "C-c C-e") #'markdown-do))

(provide 'init-markdown)
