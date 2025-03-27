(deftheme light "Theme from nano-emacs.")

;;(defun light-theme ()
(setq light-foreground "#37474F")
(setq light-background "#FFFFFF")
(setq light-highlight "#FAFAFA")
(setq light-critical "#FF6F00")
(setq light-salient "#673AB7")
(setq light-strong "#000000")
(setq light-popout "#FFAB91")
(setq light-subtle "#ECEFF1")
(setq light-faded "#B0BEC5")
;;)

(set-foreground-color light-foreground)
(set-background-color light-background)

(defun set-face (face style)
  (set-face-attribute face nil
                      :foreground 'unspecified :background 'unspecified
                      :family     'unspecified :slant      'unspecified
                      :weight     'unspecified :height     'unspecified
                      :underline  'unspecified :overline   'unspecified
                      :box        'unspecified :inherit    style))

(defface face-default nil nil)
(defface face-subtle nil nil)
(defface face-critical nil nil)
(defface face-popout nil nil)
(defface face-faded nil nil)
(defface face-salient nil nil)

(defface face-strong nil nil)

(set-face-attribute 'face-default nil
                      :foreground light-foreground
                      :background light-background)

(set-face-attribute 'face-subtle nil
                      :background light-subtle)

(set-face-attribute 'face-salient nil
                    :foreground light-salient
                    :weight 'light)

(set-face-attribute 'face-faded nil
                    :foreground light-faded
                    :weight 'light)

(set-face-attribute 'face-critical nil
                    :foreground light-foreground
                    :background light-critical)

(set-face-attribute 'face-popout nil
                    :foreground light-popout)

(set-face-attribute 'face-strong nil
                        :foreground light-strong
                        :weight 'bold)

(set-face 'bold 'face-strong)
(set-face 'italic 'face-faded)
(set-face 'bold-italic 'face-strong)
(set-face 'region 'face-subtle)
(set-face 'highlight 'face-subtle)
(set-face 'cursor 'face-default)

(provide-theme 'light)	
