
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


;; (defun my-ac-howm-mode ()
;; (when (string-equal (file-name-extension buffer-file-name) "howm") ;�g���q�� howm �Ȃ�B when �ŃG���[�ɂȂ�Ȃ� (require 'cl) ����̕��ɏ���
;; (auto-complete-mode t)
;; ;; �K�v�Ȃ�ȉ��̂悤�ɕ⊮�����w�肷��
;; ;; (setq ac-sources '(ac-source-words-in-same-mode-buffers
;; ;; ac-source-dictionary))
;; ))

;; (add-hook 'find-file-hook 'my-ac-howm-mode)

(add-to-list 'ac-modes 'howm-mode)
(add-to-list 'ac-modes 'text-mode)
