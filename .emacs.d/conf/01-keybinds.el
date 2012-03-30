;; キーバインド設定
(keyboard-translate ?\C-h ?\C-?)	; C-h と <DEL>を入れ替え
(define-key global-map (kbd "C-?") 'help-command) ; ヘルプキー割り当て

;;; --- cua-mode ---
(cua-mode t)
(setq cua-enable-cua-keys nil)		;CUAキーバーインドを無効化
