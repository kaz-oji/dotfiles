
;;; --- ���[�h�p�X�ݒ�--- 
;; load-path ��ǉ�����֐�
(defun add-to-load-path (&rest paths)
  (let (path)
	(dolist (path paths paths)
	  (let ((default-directory
			  (expand-file-name (concat user-emacs-directory path))))
		(add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
			(normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "elpa")
;; �����̃f�B���N�g���Ƃ��̃T�u�f�B���N�g���� load-path �ɒǉ�

;;; --- init-loader.el ---
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")	; �ݒ�t�@�C���̃f�B���N�g����ݒ�


;; ���̑��G���Ȑݒ�

;; HOWM �t�@�C����� auto-complete ���[�h��L���ɂ���
(add-to-list 'ac-modes 'howm-mode)
(add-to-list 'ac-modes 'text-mode)
