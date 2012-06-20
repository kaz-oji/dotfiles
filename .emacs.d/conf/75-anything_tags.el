;; Anything から TAGS を利用するコマンド
(when (and (require 'anything-exuberant-ctags nil t)
		   (require 'anything-gtags nil t))

  ;; anything-for-tags 用のソースを定義
  (setq anything-for-tags
		(list anything-c-source-imenu
			  anything-c-source-gtags-select
			  anything-c-source-exuberant-ctags-select
			  ))

  ;; anything-for-tags コマンド
  (defun anything-for-tags ()
	"Preconfigured `anything' for anything-for-tags."
	(interactive)
	(anything anything-for-tags
			  (thing-at-point 'symbol)
			  nil nil nil "*anything for tags*"))

  ;; M-t に anything-for-tags を割り当て
  (define-key global-map (kbd "M-t") 'anything-for-tags))
