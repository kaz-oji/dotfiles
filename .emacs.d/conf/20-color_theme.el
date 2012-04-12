;; color-theme
;; (when (require 'color-theme nil t)
;;   (color-theme-initialize)
;;   (color-theme-clarity))

;; 背景色と文字色設定
(custom-set-faces
 '(default ((t
             (:background "#000000" :foreground "#ffffff")
             )))
 '(cursor ((((class color)
			 (background dark))
			(:background "#ffffff"))
		   (((class color)
			 (background light))
			(:background "#999999"))
		   (t ())
		   )))
