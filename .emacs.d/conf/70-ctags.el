;;; --- ctags ---
(require 'ctags nil t)
(setq tags-revert-without-query t)
;;(setq ctags-command "ctags -e -R ")
(setq ctags-command "ctags --verbose -R --fields=\"+afikKlmnsSzt\" ")
(global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table) 

(when (require 'anything-exuberant-ctags nil t)
  (global-set-key (kbd "<C-f10>") 'anything-exuberant-ctags-select-from-here))