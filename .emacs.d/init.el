
;;; --- ロードパス設定--- 
;; load-path を追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
	(dolist (path paths paths)
	  (let ((default-directory
			  (expand-file-name (concat user-emacs-directory path))))
		(add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
			(normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "elpa")
;; 引数のディレクトリとそのサブディレクトリを load-path に追加

;;; --- init-loader.el ---
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")	; 設定ファイルのディレクトリを設定


;; その他雑多な設定

;; HOWM ファイル上で auto-complete モードを有効にする
(add-to-list 'ac-modes 'howm-mode)
(add-to-list 'ac-modes 'text-mode)
