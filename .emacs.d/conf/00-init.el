;;; --- バックアップとオートセーブ ---
;; バックアップファイルとオートセーブファイルを ~/.emacs.d/backups/ へ集める
(add-to-list 'backup-directory-alist
			 (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


;; タブ幅設定
(setq-default tab-width 4)

;; --- ツールバー表示 ---
(tool-bar-mode nil)

;; --- モードライン表示設定 ---
;; 行番号/カラム番号
(column-number-mode t)
;; ファイルサイズ
(size-indication-mode t)

;; --- タイトルバー表示設定 ---
(setq frame-title-format "%b - %f")

;; 行番号表示
(global-linum-mode t)

;; --- 括弧設定 ---
(setq show-paren-delay 0)
(show-paren-mode t)

;; --- フォント設定 ---
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil
		      :family #("ＭＳ ゴシック" 0 7 (charset cp932-2-byte))
		      :height 100))
