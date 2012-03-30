;; auto-complete ‚Ìİ’è
(when (require 'auto-complete-config nil t)
;;  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
  (setq ac-auto-show-menu nil)			; •âŠ®ƒƒjƒ…[‚ğ•\¦‚µ‚È‚¢‚æ‚¤‚É‚·‚é
  (global-set-key (kbd "M-i") 'auto-complete) ;
  (ac-config-default))

