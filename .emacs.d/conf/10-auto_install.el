;; auto-install
(when (require 'auto-install nil t)
  ;; インストールディレクトリ
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWikiに登録されているelispの名前を取得
  (auto-install-update-emacswiki-package-name t)
  ;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))

