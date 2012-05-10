;; ElScreen
(setq elscreen-prefix-key (kbd "C-t"))
(when (require 'elscreen nil t)
  (require 'elscreen-howm nil t)
  (global-set-key [(C-tab)] 'elscreen-next)
;  (global-set-key [(C-S-tab)] 'elscreen-previous)
  )
