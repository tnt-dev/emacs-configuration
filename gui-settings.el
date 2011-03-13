(scroll-bar-mode -1)

;; Toggle off tool-bar
(tool-bar-mode 0)

;; Maximize windows
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; Speedbar hotkey
(global-set-key [(f8)] 'speedbar)

(cond ((eq window-system 'ns)
       (set-default-font "Monaco-14")
       (set-fontset-font (frame-parameter nil 'font)
			 'han (font-spec :family "STHeiTi" :size 16))
       (set-fontset-font (frame-parameter nil 'font)
			 'symbol (font-spec :family "STHeiTi" :size 16))
       (set-fontset-font (frame-parameter nil 'font)
			 'cjk-misc (font-spec :family "STHeiTi" :size 16))
       (set-fontset-font (frame-parameter nil 'font)
			 'bopomofo (font-spec :family "STHeiTi" :size 16)))
      ((eq window-system 'w32)
       (message "windows-font")
       (setq w32-ch-font "-outline-XHei Mono-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")
       (set-default-font "Monaco-11")
       (set-fontset-font (frame-parameter nil 'font)
			 'han (font-spec :family "XHei" :size 16))
       (set-fontset-font (frame-parameter nil 'font)
			 'symbol (font-spec :family "XHei" :size 16))
       (set-fontset-font (frame-parameter nil 'font)
			 'cjk-misc (font-spec :family "XHei" :size 16))
       (set-fontset-font (frame-parameter nil 'font)
			 'bopomofo (font-spec :family "XHei" :size 16))))


