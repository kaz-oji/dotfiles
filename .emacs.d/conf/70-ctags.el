;;; --- ctags ---
(require 'ctags nil t)
(setq tags-revert-without-query t)
(setq ctags-command "ctags -e -R ")
(global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table)
