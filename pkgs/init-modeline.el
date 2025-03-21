(setq-default header-line-format (list
    '(:eval (propertize " %b "))

    '(:eval (when-let (vc vc-mode)
    (list " " (propertize (substring vc 5) 'face 'font-lock-comment-face) " ")))

    '(:eval (propertize " %p "))

    '(:eval (propertize " %l:%c "))

    '(:eval (propertize
                        " " 'display
                        `((space :align-to (- (+ right right-fringe right-margin)
                                              ,(+ 3 (string-width mode-name)))))))

    (propertize " %m " 'face 'font-lock-string-face)
))

(setq-default mode-line-format nil)

(provide 'init-modeline)
