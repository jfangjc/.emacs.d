;;; slate-theme.el --- Slate dark theme -*- lexical-binding: t; -*-
(deftheme slate "Slate dark, matching the desktop and foot palette.")

;; Dark palette from https://github.com/jfangjc/slate-theme/blob/main/slate.json.
;; ANSI colors follow ~/.nix/home/foot.nix.
(let* ((bg        "#080C10")
       (surface   "#101820")
       (raised    "#202830")
       (border    "#687080")
       (divider   "#405058")
       (fg        "#F4F4F4")
       (muted     "#B8C0C8")
       (selection "#284850")
       (focus     "#78C8D8")
       (blue      "#A0C0F0")
       (green     "#B0E080")
       (red       "#F09898")
       (rose      "#F0B8B8")
       (teal      "#90D0C0")
       (amber     "#E8C088"))

  (custom-theme-set-faces
   'slate

   ;; Core UI
   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background ,focus))))
   `(fringe ((t (:background ,bg :foreground ,muted))))
   `(vertical-border ((t (:foreground ,divider))))
   `(window-divider ((t (:foreground ,divider))))
   `(window-divider-first-pixel ((t (:foreground ,divider))))
   `(window-divider-last-pixel ((t (:foreground ,divider))))

   `(region ((t (:background ,selection :foreground ,fg))))
   `(secondary-selection ((t (:background ,raised))))
   `(highlight ((t (:background ,raised))))
   `(hl-line ((t (:background ,surface))))

   `(minibuffer-prompt ((t (:foreground ,focus :weight bold))))
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,rose :underline t))))
   `(shadow ((t (:foreground ,muted))))
   `(success ((t (:foreground ,green :weight bold))))
   `(warning ((t (:foreground ,amber :weight bold))))
   `(error ((t (:foreground ,red :weight bold))))

   ;; Mode line
   `(mode-line
     ((t (:background ,surface
          :foreground ,fg
          :box nil
          :weight bold))))
   `(mode-line-inactive
     ((t (:background ,surface
          :foreground ,muted
          :box nil))))
   `(mode-line-buffer-id
     ((t (:foreground ,focus :weight bold))))
   `(mode-line-emphasis
     ((t (:weight bold))))

   ;; Header line / tabs
   `(header-line
     ((t (:background ,surface
          :foreground ,fg
          :box nil))))

   `(tab-bar
     ((t (:background ,surface
          :foreground ,muted))))
   `(tab-bar-tab
     ((t (:background ,selection
          :foreground ,fg
          :weight bold
          :box nil))))
   `(tab-bar-tab-inactive
     ((t (:background ,surface
          :foreground ,muted
          :box nil))))

   ;; Font lock / syntax
   `(font-lock-builtin-face ((t (:foreground ,teal))))
   `(font-lock-comment-face ((t (:foreground ,muted :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,muted))))
   `(font-lock-constant-face ((t (:foreground ,rose))))
   `(font-lock-doc-face ((t (:foreground ,muted :slant italic))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,rose :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,red))))
   `(font-lock-number-face ((t (:foreground ,rose))))
   `(font-lock-preprocessor-face ((t (:foreground ,rose))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,teal))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,rose))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,blue))))
   `(font-lock-variable-name-face ((t (:foreground ,fg))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))

   ;; Search
   `(isearch
     ((t (:background ,rose
          :foreground ,bg
          :weight bold))))
   `(lazy-highlight
     ((t (:background ,selection
          :foreground ,fg))))
   `(isearch-fail
     ((t (:background ,red
          :foreground ,bg))))

   ;; Line numbers
   `(line-number
     ((t (:background ,bg
          :foreground ,muted))))
   `(line-number-current-line
     ((t (:background ,bg
          :foreground ,focus
          :weight bold))))

   ;; Parentheses
   `(show-paren-match
     ((t (:background ,selection
          :foreground ,teal
          :weight bold))))
   `(show-paren-mismatch
     ((t (:background ,red
          :foreground ,bg
          :weight bold))))

   ;; Whitespace
   `(whitespace-space ((t (:foreground ,selection))))
   `(whitespace-tab ((t (:foreground ,selection))))
   `(whitespace-newline ((t (:foreground ,selection))))
   `(whitespace-trailing
     ((t (:background ,red
          :foreground ,bg))))

   ;; Compilation
   `(compilation-info ((t (:foreground ,green))))
   `(compilation-warning ((t (:foreground ,amber))))
   `(compilation-error ((t (:foreground ,red))))
   `(compilation-line-number ((t (:foreground ,blue))))

   ;; Diff
   `(diff-added
     ((t (:background ,surface
          :foreground ,green))))
   `(diff-removed
     ((t (:background ,surface
          :foreground ,red))))
   `(diff-changed
     ((t (:background ,surface
          :foreground ,amber))))
   `(diff-header
     ((t (:background ,surface
          :foreground ,fg))))
   `(diff-file-header
     ((t (:background ,raised
          :foreground ,fg
          :weight bold))))
   `(diff-hunk-header
     ((t (:background ,raised
          :foreground ,blue))))

   ;; Dired
   `(dired-directory ((t (:foreground ,blue :weight bold))))
   `(dired-symlink ((t (:foreground ,teal))))
   `(dired-marked ((t (:foreground ,rose :weight bold))))
   `(dired-flagged ((t (:foreground ,red))))

   ;; Completions
   `(completions-common-part ((t (:foreground ,blue :weight bold))))
   `(completions-first-difference ((t (:foreground ,rose :weight bold))))

   ;; Company
   `(company-tooltip
     ((t (:background ,surface :foreground ,fg))))
   `(company-tooltip-selection
     ((t (:background ,raised :foreground ,fg))))
   `(company-tooltip-common
     ((t (:foreground ,blue :weight bold))))
   `(company-scrollbar-bg
     ((t (:background ,raised))))
   `(company-scrollbar-fg
     ((t (:background ,selection))))

   ;; Corfu
   `(corfu-default
     ((t (:background ,surface :foreground ,fg))))
   `(corfu-current
     ((t (:background ,raised :foreground ,fg))))
   `(corfu-border
     ((t (:background ,border))))

   ;; Vertico
   `(vertico-current
     ((t (:background ,raised
          :foreground ,fg))))

   ;; Orderless
   `(orderless-match-face-0 ((t (:foreground ,blue :weight bold))))
   `(orderless-match-face-1 ((t (:foreground ,rose :weight bold))))
   `(orderless-match-face-2 ((t (:foreground ,green :weight bold))))
   `(orderless-match-face-3 ((t (:foreground ,teal :weight bold))))

   ;; Which-key
   `(which-key-key-face ((t (:foreground ,blue :weight bold))))
   `(which-key-command-description-face ((t (:foreground ,fg))))
   `(which-key-group-description-face ((t (:foreground ,rose))))
   `(which-key-local-map-description-face ((t (:foreground ,teal))))

   ;; Markdown
   `(markdown-header-face-1
     ((t (:foreground ,blue :weight bold :height 1.2))))
   `(markdown-header-face-2
     ((t (:foreground ,rose :weight bold :height 1.15))))
   `(markdown-header-face-3
     ((t (:foreground ,teal :weight bold))))
   `(markdown-header-face-4
     ((t (:foreground ,green :weight bold))))
   `(markdown-code-face
     ((t (:background ,surface :foreground ,teal))))
   `(markdown-inline-code-face
     ((t (:background ,surface :foreground ,teal))))
   `(markdown-link-face
     ((t (:foreground ,blue :underline t))))
   `(markdown-url-face
     ((t (:foreground ,muted))))

   ;; ANSI colors
   `(ansi-color-black ((t (:foreground ,bg :background ,bg))))
   `(ansi-color-red ((t (:foreground ,red :background ,red))))
   `(ansi-color-green ((t (:foreground ,green :background ,green))))
   `(ansi-color-yellow ((t (:foreground ,amber :background ,amber))))
   `(ansi-color-blue ((t (:foreground ,blue :background ,blue))))
   `(ansi-color-magenta ((t (:foreground ,rose :background ,rose))))
   `(ansi-color-cyan ((t (:foreground ,teal :background ,teal))))
   `(ansi-color-white ((t (:foreground ,fg :background ,fg))))

   ;; Bright ANSI colors match foot.
   `(ansi-color-bright-black ((t (:foreground ,muted :background ,muted))))
   `(ansi-color-bright-red ((t (:foreground ,red :background ,red))))
   `(ansi-color-bright-green ((t (:foreground ,green :background ,green))))
   `(ansi-color-bright-yellow ((t (:foreground ,amber :background ,amber))))
   `(ansi-color-bright-blue ((t (:foreground ,blue :background ,blue))))
   `(ansi-color-bright-magenta ((t (:foreground ,rose :background ,rose))))
   `(ansi-color-bright-cyan ((t (:foreground ,focus :background ,focus))))
   `(ansi-color-bright-white ((t (:foreground ,fg :background ,fg))))

   ;; Term
   `(term-color-black ((t (:foreground ,bg :background ,bg))))
   `(term-color-red ((t (:foreground ,red :background ,red))))
   `(term-color-green ((t (:foreground ,green :background ,green))))
   `(term-color-yellow ((t (:foreground ,amber :background ,amber))))
   `(term-color-blue ((t (:foreground ,blue :background ,blue))))
   `(term-color-magenta ((t (:foreground ,rose :background ,rose))))
   `(term-color-cyan ((t (:foreground ,teal :background ,teal))))
   `(term-color-white ((t (:foreground ,fg :background ,fg))))))

(custom-theme-set-variables
 'slate
 '(ansi-color-names-vector
   ["#080C10" "#F09898" "#B0E080" "#E8C088"
    "#A0C0F0" "#F0B8B8" "#90D0C0" "#F4F4F4"]))

;;;###autoload
(when load-file-name
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory
    (file-name-directory load-file-name))))

(provide-theme 'slate)

;;; slate-theme.el ends here
