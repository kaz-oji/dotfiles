;; auto-complete の設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
  (setq ac-auto-show-menu nil)			; 補完メニューを表示しないようにする
  (setq ac-delay 1)
  (global-set-key (kbd "M-i") 'auto-complete) ;
  (ac-config-default))

