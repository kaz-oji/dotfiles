;; GotoChg

(when (require 'goto-chg nil t)
  (global-set-key "\C-xj" 'goto-last-change)
  (global-set-key "\C-xJ" 'goto-last-change-reverse))
