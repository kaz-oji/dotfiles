;; Anything
;; (auto-instal-batch "anything")
(when (require 'anything nil t)
  (when (require 'anything-config nil t)
	;; M-y anything-show-kill-ring ‚ðŠ„‚è“–‚Ä
	(define-key global-map (kbd "M-y") 'anything-show-kill-ring)
	)

  (require 'anything-match-plugin nil t)

  (require 'anything-complete nil t)

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
	(require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
	;; describe-bindings ‚ð Anything ‚É’u‚«Š·‚¦‚é
	(descbinds-anything-install))
   )
