;; Anything
;; (auto-instal-batch "anything")
(when (require 'anything nil t)
  (when (require 'anything-config nil t)
	;; M-y anything-show-kill-ring を割り当て
	(define-key global-map (kbd "M-y") 'anything-show-kill-ring)
	)

  (require 'anything-match-plugin nil t)

  (require 'anything-complete nil t)

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
	(require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
	;; describe-bindings を Anything に置き換える
	(descbinds-anything-install))
   )
