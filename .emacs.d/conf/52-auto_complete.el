;; auto-complete �̐ݒ�
(when (require 'auto-complete-config nil t)
;;  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
  (setq ac-auto-show-menu nil)			; �⊮���j���[��\�����Ȃ��悤�ɂ���
  (global-set-key (kbd "M-i") 'auto-complete) ;
  (ac-config-default))

