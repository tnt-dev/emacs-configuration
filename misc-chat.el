(require 'jabber)

(require 'password-cache)

(setq jabber-account-list
      '(("zellux@gmail.com" 
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

;; (setq jabber-auto-reconnect 't)
;; (setq password-cache-expiry 99999)

;; (autoload 'twitter-get-friends-timeline "twitter" nil t)
;; (autoload 'twitter-status-edit "twitter" nil t)
;; (global-set-key "\C-xt" 'twitter-get-friends-timeline)
;; (add-hook 'twitter-status-edit-mode-hook 'longlines-mode)

