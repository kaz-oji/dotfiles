;; color-moccur
(when (require 'color-moccur nil t)
  ;; M-o に occur-by-moccur を割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りで AND 検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索で除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; Migemo を利用できる環境の場合は Migemo を使う
  (when (and (executable-find "cmigemo")
			 (require 'migemo nil t))
	(setq moccur-use-migemo t))
  (when (require 'moccur-edit nil t))
	
