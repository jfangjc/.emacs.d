
(deftheme custom)

;; Based on https://github.com/nyoom-engineering/oxocarbon.nvim
(let* ((bg        "#2E3440")
       (bg-alt    "#262626")
       (bg-hl     "#393939")
       (bg-subtle "#525252")

       (fg        "#DDE1E6")
       (fg-bright "#F2F4F8")
       (fg-dim    "#A2A9B0")
       (fg-muted  "#697077")

       (pink      "#FF7EB6")
       (magenta   "#EE5396")
       (green     "#42BE65")
       (cyan      "#3DDBD9")
       (blue      "#33B1FF")
       (lightblue "#82CFFF")
       (purple    "#BE95FF")
       (orange    "#FF832B")
       (yellow    "#F1C21B")
       (red       "#FA4D56"))

  (custom-theme-set-faces
   'custom

   ;; Core UI
   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background ,fg-bright))))
   `(fringe ((t (:background ,bg :foreground ,fg-muted))))
   `(vertical-border ((t (:foreground ,bg-subtle))))
   `(window-divider ((t (:foreground ,bg-subtle))))
   `(window-divider-first-pixel ((t (:foreground ,bg-subtle))))
   `(window-divider-last-pixel ((t (:foreground ,bg-subtle))))

   `(region ((t (:background ,bg-subtle :foreground ,fg-bright))))
   `(secondary-selection ((t (:background ,bg-hl))))
   `(highlight ((t (:background ,bg-hl))))
   `(hl-line ((t (:background ,bg-alt))))

   `(minibuffer-prompt ((t (:foreground ,blue :weight bold))))
   `(link ((t (:foreground ,lightblue :underline t))))
   `(link-visited ((t (:foreground ,purple :underline t))))
   `(shadow ((t (:foreground ,fg-muted))))
   `(success ((t (:foreground ,green :weight bold))))
   `(warning ((t (:foreground ,yellow :weight bold))))
   `(error ((t (:foreground ,red :weight bold))))

   ;; Mode line
   `(mode-line
     ((t (:background ,fg-bright
          :foreground ,bg
          :box nil
          :weight bold))))
   `(mode-line-inactive
     ((t (:background ,bg-alt
          :foreground ,fg-muted
          :box nil))))
   `(mode-line-buffer-id
     ((t (:foreground ,bg :weight bold))))
   `(mode-line-emphasis
     ((t (:weight bold))))

   ;; Header line / tabs
   `(header-line
     ((t (:background ,bg-alt
          :foreground ,fg
          :box nil))))

   `(tab-bar
     ((t (:background ,bg-alt
          :foreground ,fg-muted))))
   `(tab-bar-tab
     ((t (:background ,fg-bright
          :foreground ,bg
          :weight bold
          :box nil))))
   `(tab-bar-tab-inactive
     ((t (:background ,bg-alt
          :foreground ,fg-muted
          :box nil))))

   ;; Font lock / syntax
   `(font-lock-builtin-face ((t (:foreground ,cyan))))
   `(font-lock-comment-face ((t (:foreground ,fg-muted :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,fg-muted))))
   `(font-lock-constant-face ((t (:foreground ,purple))))
   `(font-lock-doc-face ((t (:foreground ,fg-dim :slant italic))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,magenta :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,red))))
   `(font-lock-number-face ((t (:foreground ,purple))))
   `(font-lock-preprocessor-face ((t (:foreground ,pink))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,cyan))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,purple))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,lightblue))))
   `(font-lock-variable-name-face ((t (:foreground ,fg-bright))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))

   ;; Search
   `(isearch
     ((t (:background ,pink
          :foreground ,bg
          :weight bold))))
   `(lazy-highlight
     ((t (:background ,bg-subtle
          :foreground ,fg-bright))))
   `(isearch-fail
     ((t (:background ,red
          :foreground ,bg))))

   ;; Line numbers
   `(line-number
     ((t (:background ,bg
          :foreground ,fg-muted))))
   `(line-number-current-line
     ((t (:background ,bg
          :foreground ,blue
          :weight bold))))

   ;; Parentheses
   `(show-paren-match
     ((t (:background ,bg-subtle
          :foreground ,cyan
          :weight bold))))
   `(show-paren-mismatch
     ((t (:background ,red
          :foreground ,bg
          :weight bold))))

   ;; Whitespace
   `(whitespace-space ((t (:foreground ,bg-subtle))))
   `(whitespace-tab ((t (:foreground ,bg-subtle))))
   `(whitespace-newline ((t (:foreground ,bg-subtle))))
   `(whitespace-trailing
     ((t (:background ,red
          :foreground ,bg))))

   ;; Compilation
   `(compilation-info ((t (:foreground ,green))))
   `(compilation-warning ((t (:foreground ,yellow))))
   `(compilation-error ((t (:foreground ,red))))
   `(compilation-line-number ((t (:foreground ,lightblue))))

   ;; Diff
   `(diff-added
     ((t (:background ,bg-alt
          :foreground ,green))))
   `(diff-removed
     ((t (:background ,bg-alt
          :foreground ,red))))
   `(diff-changed
     ((t (:background ,bg-alt
          :foreground ,yellow))))
   `(diff-header
     ((t (:background ,bg-alt
          :foreground ,fg-bright))))
   `(diff-file-header
     ((t (:background ,bg-hl
          :foreground ,fg-bright
          :weight bold))))
   `(diff-hunk-header
     ((t (:background ,bg-hl
          :foreground ,lightblue))))

   ;; Dired
   `(dired-directory ((t (:foreground ,blue :weight bold))))
   `(dired-symlink ((t (:foreground ,cyan))))
   `(dired-marked ((t (:foreground ,pink :weight bold))))
   `(dired-flagged ((t (:foreground ,red))))

   ;; Completions
   `(completions-common-part ((t (:foreground ,blue :weight bold))))
   `(completions-first-difference ((t (:foreground ,pink :weight bold))))

   ;; Company
   `(company-tooltip
     ((t (:background ,bg-alt :foreground ,fg))))
   `(company-tooltip-selection
     ((t (:background ,bg-hl :foreground ,fg-bright))))
   `(company-tooltip-common
     ((t (:foreground ,blue :weight bold))))
   `(company-scrollbar-bg
     ((t (:background ,bg-hl))))
   `(company-scrollbar-fg
     ((t (:background ,bg-subtle))))

   ;; Corfu
   `(corfu-default
     ((t (:background ,bg-alt :foreground ,fg))))
   `(corfu-current
     ((t (:background ,bg-hl :foreground ,fg-bright))))
   `(corfu-border
     ((t (:background ,bg-subtle))))

   ;; Vertico
   `(vertico-current
     ((t (:background ,bg-hl
          :foreground ,fg-bright))))

   ;; Orderless
   `(orderless-match-face-0 ((t (:foreground ,blue :weight bold))))
   `(orderless-match-face-1 ((t (:foreground ,pink :weight bold))))
   `(orderless-match-face-2 ((t (:foreground ,green :weight bold))))
   `(orderless-match-face-3 ((t (:foreground ,cyan :weight bold))))

   ;; Which-key
   `(which-key-key-face ((t (:foreground ,blue :weight bold))))
   `(which-key-command-description-face ((t (:foreground ,fg))))
   `(which-key-group-description-face ((t (:foreground ,pink))))
   `(which-key-local-map-description-face ((t (:foreground ,cyan))))

   ;; Markdown
   `(markdown-header-face-1
     ((t (:foreground ,blue :weight bold :height 1.2))))
   `(markdown-header-face-2
     ((t (:foreground ,pink :weight bold :height 1.15))))
   `(markdown-header-face-3
     ((t (:foreground ,cyan :weight bold))))
   `(markdown-header-face-4
     ((t (:foreground ,green :weight bold))))
   `(markdown-code-face
     ((t (:background ,bg-alt :foreground ,cyan))))
   `(markdown-inline-code-face
     ((t (:background ,bg-alt :foreground ,cyan))))
   `(markdown-link-face
     ((t (:foreground ,lightblue :underline t))))
   `(markdown-url-face
     ((t (:foreground ,fg-muted))))

   ;; ANSI colors
   `(ansi-color-black ((t (:foreground ,bg-alt :background ,bg-alt))))
   `(ansi-color-red ((t (:foreground ,pink :background ,pink))))
   `(ansi-color-green ((t (:foreground ,green :background ,green))))
   `(ansi-color-yellow ((t (:foreground ,lightblue :background ,lightblue))))
   `(ansi-color-blue ((t (:foreground ,blue :background ,blue))))
   `(ansi-color-magenta ((t (:foreground ,magenta :background ,magenta))))
   `(ansi-color-cyan ((t (:foreground ,cyan :background ,cyan))))
   `(ansi-color-white ((t (:foreground ,fg :background ,fg))))

   ;; Term
   `(term-color-black ((t (:foreground ,bg-alt :background ,bg-alt))))
   `(term-color-red ((t (:foreground ,pink :background ,pink))))
   `(term-color-green ((t (:foreground ,green :background ,green))))
   `(term-color-yellow ((t (:foreground ,lightblue :background ,lightblue))))
   `(term-color-blue ((t (:foreground ,blue :background ,blue))))
   `(term-color-magenta ((t (:foreground ,magenta :background ,magenta))))
   `(term-color-cyan ((t (:foreground ,cyan :background ,cyan))))
   `(term-color-white ((t (:foreground ,fg :background ,fg))))))

;;;###autoload
(when load-file-name
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory
    (file-name-directory load-file-name))))

(provide-theme 'custom)
