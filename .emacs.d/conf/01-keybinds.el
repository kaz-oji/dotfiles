;; �L�[�o�C���h�ݒ�
(keyboard-translate ?\C-h ?\C-?)	; C-h �� <DEL>�����ւ�
(define-key global-map (kbd "C-?") 'help-command) ; �w���v�L�[���蓖��

;;; --- cua-mode ---
(cua-mode t)
(setq cua-enable-cua-keys nil)		;CUA�L�[�o�[�C���h�𖳌���
