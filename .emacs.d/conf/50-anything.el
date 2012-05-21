;; Anything
;; (auto-instal-batch "anything")
(when (require 'anything nil t)
  (when (require 'anything-config nil t)
	;; M-y anything-show-kill-ring を割り当て
	(define-key global-map (kbd "M-y") 'anything-show-kill-ring)
	)

  (require 'anything-match-plugin nil t)

  (require 'anything-complete nil t)

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
	(require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
	;; describe-bindings を Anything に置き換える
	(descbinds-anything-install))

  ;; anything-c-moccur.el
  ;; http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el
  (when (require 'anything-c-moccur nil t)
	(setq
	 ;; anything-c-moccur 用 'anything-idle-delay
	 anything-c-moccur-anything-idle-delay 0.1
	 ;; バッファ情報のハイライト
	 anything-c-moccur-higligt-info-line-flag t
	 ;; 現在選択中の候補の位置を他のWindowに表示
	 anything-c-moccur-enable-auto-look-flag t
	 ;; 起動時にポイントの位置の単語を初期パターンにする
	 anything-c-moccur-enable-initial-pattern t)
	;; C-M-o に anything-c-moccur-occur-by-moccur を割り当てる
	(global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur)
	(global-set-key (kbd "C-M-o") 'anything-c-moccur-dmoccur))
   )
