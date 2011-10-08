(require 'xcscope)
(require 'linum)
(require 'cc-mode)
(require 'bm)

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

(global-set-key (kbd "<f5>") 'bm-toggle)
(global-set-key (kbd "<f6>") 'bm-next)
(global-set-key (kbd "<f7>") 'bm-show)

(setq popup-terminal-command '("gnome-terminal"))

;; (load "my-python.el")

;; (load "my-picture.el")
;; (load "my-gnus.el")
(load "psvn.el")
(load "my-doxygen.el")
;; (load "my-org-mode.el")
(load "my-auctex.el")
;; (load "my-fp.el")
(load "my-utils.el")
;; (load "my-vcs.el")

(load "my-cc-mode.el")
;; (setq my-muse-base-dir "~/notes")
;; (load "my-muse.el")
;; (load "my-emms.el")
(load "misc-chat.el")

(cond
 ((not (boundp 'initial-window-system))
  (message "Console"))
 (t (load "gui-settings.el")))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(semantic-decoration-on-private-members-face ((((class color) (background dark)) (:background "#2e3330")))))
