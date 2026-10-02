(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

;; Configure servers when Eglot is first loaded by `eglot-ensure'.
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((c++-mode c-mode) . ("clangd")))
  (add-to-list 'eglot-server-programs
               '(nix-mode . ("nixd")))
  (add-to-list 'eglot-server-programs
               '((verilog-mode verilog-ts-mode) . ("slang-server"))))

(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'rust-mode-hook #'eglot-ensure)
(add-hook 'typescript-ts-mode-hook #'eglot-ensure)

(add-hook 'nix-mode-hook #'eglot-ensure)

(add-hook 'verilog-mode-hook #'eglot-ensure)

(provide 'init-eglot)
