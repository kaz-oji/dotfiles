;; auto-install
(when (require 'auto-install nil t)
  ;; �C���X�g�[���f�B���N�g��
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWiki�ɓo�^����Ă���elisp�̖��O���擾
  (auto-install-update-emacswiki-package-name t)
  ;; install-elisp �̊֐��𗘗p�\�ɂ���
  (auto-install-compatibility-setup))

