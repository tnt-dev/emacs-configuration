(require 'xcscope)
(require 'linum)
(require 'cc-mode)
(require 'bm)
(require 'folding)

;; (require 'pysmell)
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/emacs/elpa/package.el"))
  (package-initialize))

;; yasnippet
(add-to-list 'load-path "~/emacs/utils/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/emacs/utils/yasnippet-0.6.1c/snippets")

(global-set-key (kbd "<f5>") 'bm-toggle)
(global-set-key (kbd "<f6>") 'bm-next)
(global-set-key (kbd "<f7>") 'bm-show)

(setq popup-terminal-command '("gnome-terminal"))

(load "lang-python.el")

;; (load "my-picture.el")
(load "my-gnus.el")
(load "psvn.el")
(load "my-doxygen.el")
;; (load "my-auctex.el")
(load "my-fp.el")
(load "lang-scala.el")			;
(load "my-utils.el")
;; (load "my-vcs.el")
(load "lang-ruby.el")
(load "my-cc-mode.el")
(setq my-muse-base-dir "~/Documents/notes")
(load "my-muse.el")
;; (load "my-emms.el")

(add-to-list 'load-path "~/emacs/langmode/javascript")
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
