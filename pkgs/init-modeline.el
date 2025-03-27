(setq-default header-line-format nil)

(setq-default header-line-format (list
    '(:eval (propertize (format " %s " (projectile-project-name)) 'face 'header-line-project-face))

    '(:eval (propertize " %b " 'face 'header-line-filename-face))

    '(:eval (when-let (vc vc-mode)
    (list " " (propertize (substring vc 5) 'face 'font-lock-comment-face) " ")))

    '(:eval (propertize " %p " 'face 'header-line-position-face))

    '(:eval (propertize " %l:%c " 'face 'header-line-position-face))

    '(:eval (propertize
                        " " 'display
                        `((space :align-to (- (+ right right-fringe right-margin)
                                              ,(+ 3 (string-width mode-name)))))))

    '(:eval (propertize " %m " 'face 'header-line-mode-face))
))

(set-face-attribute 'header-line nil
    :background "gray60"
    :box '(:line-width 6 :color "gray60" :style nil))

(make-face 'header-line-project-face)
(make-face 'header-line-filename-face)
(make-face 'header-line-position-face)
(make-face 'header-line-mode-face)

(set-face-attribute 'header-line-project-face nil
    :foreground "gray20")
(set-face-attribute 'header-line-filename-face nil
    :foreground "#eab700"
    :weight 'bold)
(set-face-attribute 'header-line-position-face nil
    :foreground "gray20")
(set-face-attribute 'header-line-mode-face nil
    :foreground "gray20")

(setq-default mode-line-format nil)

(provide 'init-modeline)
