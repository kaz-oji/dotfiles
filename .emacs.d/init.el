
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


;; (defun my-ac-howm-mode ()
;; (when (string-equal (file-name-extension buffer-file-name) "howm") ;拡張子が howm なら。 when でエラーになるなら (require 'cl) を上の方に書く
;; (auto-complete-mode t)
;; ;; 必要なら以下のように補完候補を指定する
;; ;; (setq ac-sources '(ac-source-words-in-same-mode-buffers
;; ;; ac-source-dictionary))
;; ))

;; (add-hook 'find-file-hook 'my-ac-howm-mode)

(add-to-list 'ac-modes 'howm-mode)
(add-to-list 'ac-modes 'text-mode)
