;;; --- �o�b�N�A�b�v�ƃI�[�g�Z�[�u ---
;; �o�b�N�A�b�v�t�@�C���ƃI�[�g�Z�[�u�t�@�C���� ~/.emacs.d/backups/ �֏W�߂�
(add-to-list 'backup-directory-alist
			 (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


;; �^�u���ݒ�
(setq-default tab-width 4)

;; --- ���[�h���C���\���ݒ� ---
;; �s�ԍ�/�J�����ԍ�
(column-number-mode t)
;; �t�@�C���T�C�Y
(size-indication-mode t)

;; --- �^�C�g���o�[�\���ݒ� ---
(setq frame-title-format "%b - %f")

;; �s�ԍ��\��
(global-linum-mode t)

;; --- ���ʐݒ� ---
(setq show-paren-delay 0)
(show-paren-mode t)

(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil
		      :family #("�l�r �S�V�b�N" 0 7 (charset cp932-2-byte))
		      :height 100))
