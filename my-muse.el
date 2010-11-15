(require 'muse)
(require 'muse-mode)
(require 'muse-html)
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)
(require 'muse-colors)
(require 'muse-wiki)
(require 'outline)
(require 'htmlize)

(custom-set-variables
 '(muse-html-meta-content-encoding (quote utf-8))
 '(muse-html-charset-default "utf-8")
 '(muse-html-encoding-default (quote utf-8))
)

(setq htmlize-output-type 'css)

(setq muse-html-encoding-default 'utf-8)
(setq muse-html-charset-default "utf-8") 

(add-hook 'muse-mode-hook #'(lambda ()
                             (set-buffer-file-coding-system 'utf-8))) 

(setq muse-html-meta-content-type "text/html; charset=utf-8")

(setq muse-html-header (concat my-muse-base-dir "/common/templates/header.html"))
(setq muse-html-footer (concat my-muse-base-dir "/common/templates/footer.html"))

(setq muse-project-alist
      `(
	("Home" 
	 (,(concat my-muse-base-dir "/muse/home")
	  :default "index")
	 (:base "html" :path ,(concat my-muse-base-dir "/html/home")))
	("Economics"
	 (,@(muse-project-alist-dirs (concat my-muse-base-dir "/muse/economics"))
	  :default "index"
	  :force-publish ("index"))
	 ,@(muse-project-alist-styles (concat my-muse-base-dir "/muse/economics")
				      (concat my-muse-base-dir "/html/economics")
				      "html"))
	("Design"
	 (,@(muse-project-alist-dirs (concat my-muse-base-dir "/muse/design"))
	  :default "index"
	  :force-publish ("index"))
	 ,@(muse-project-alist-styles (concat my-muse-base-dir "/muse/design")
				      (concat my-muse-base-dir "/html/design")
				      "html"))
	("Philosophy"
	 (,@(muse-project-alist-dirs (concat my-muse-base-dir "/muse/philosophy"))
	  :default "index"
	  :force-publish ("index"))
	 ,@(muse-project-alist-styles (concat my-muse-base-dir "/muse/philosophy")
				      (concat my-muse-base-dir "/html/philosophy")
				      "html"))
	("Novels"
	 (,@(muse-project-alist-dirs (concat my-muse-base-dir "/muse/novel"))
	  :default "index"
	  :force-publish ("index"))
	 ,@(muse-project-alist-styles (concat my-muse-base-dir "/muse/novel")
				      (concat my-muse-base-dir "/html/novel")
				      "html"))
	;; ("Lectures"
	;;  (,(concat my-muse-base-dir "/muse/lectures")
	;;   :default "index")
	;;  (:base "html" :path ,(concat my-muse-base-dir "/html/lectures")))
	;; ("CompLang"
	;;  (,(concat my-muse-base-dir "/muse/complang")
	;;   :default "index")
	;;  (:base "html" :path ,(concat my-muse-base-dir "/html/complang")))
	;; ("Software"
	;;  (,(concat my-muse-base-dir "/muse/software")
	;;   :default "index")
	;;  (:base "html" :path ,(concat my-muse-base-dir "/html/software")))
	;; ("Git"
	;;  (,(concat my-muse-base-dir "/muse/software/git")
	;;   :default "index")
	;;  (:base "html" :path ,(concat my-muse-base-dir "/html/software/git")))
	;; ("Linux"
	;;  (,(concat my-muse-base-dir "/muse/software/linux")
	;;   :default "index")
	;;  (:base "html" :path ,(concat my-muse-base-dir "/html/software/linux")))
	))


(defvar my-muse-publish-directory (concat my-muse-base-dir "/html/"))

(defun ywb-muse-relative-path (file)
  (concat
   (file-relative-name
    my-muse-publish-directory
    (file-name-directory muse-publishing-current-output-path))
   file))

(setq muse-latex-footer
      "\\footnote{\\emph{This document was generated by \\href{http://mwolson.org/projects/EmacsMuse.html}{Emacs Muse}}.} \n \\end{document}")

;; Command-line argument --all for publishing all projects, copied from
;; http://jianlee.ylinux.org/Computer/downloads/muse-init.txt
;; 
;; Usage: emacs -nw -q -batch -l ~/.emacs muse-init.el -f muse-project-batch-publish --force --all
(defun muse-project-batch-publish ()
  "Publish Muse files in batch mode."
  (let ((muse-batch-publishing-p t)
        force)
    (if (string= "--force" (or (car command-line-args-left) ""))
        (setq force t
              command-line-args-left (cdr command-line-args-left)))
    (if (string= "--all" (or (car command-line-args-left) ""))
        (setq command-line-args-left (nconc (cdr command-line-args-left)
                                            (mapcar 'car muse-project-alist))))
    (if command-line-args-left
        (dolist (project (delete-dups command-line-args-left))
          (message "Publishing project %s ..." project)
          (muse-project-publish project force))
      (message "No projects specified."))))

;; (defun zellux-publish-source-tag (beg end attrs)
;;   "" Publish source block with specific color scheme. ""
;;   (muse-publish-example-tag beg end))

;; (add-to-list 'muse-publish-markup-tags '("source" t t nil zellux-publish-source-tag))

;;;_+ insert toplink in html files
;; (defun ywb/muse-publish-markup-heading ()
;;    (let* ((len (length (match-string 1)))
;;           (start (muse-markup-text
;;                   (cond ((= len 1) 'section)
;;                         ((= len 2) 'subsection)
;;                         ((= len 3) 'subsubsection)
;;                         (t 'section-other))
;;                   len))
;;           (end   (muse-markup-text
;;                   (cond ((= len 1) 'section-end)
;;                         ((= len 2) 'subsection-end)
;;                         ((= len 3) 'subsubsection-end)
;;                         (t 'section-other-end))
;;                   len)))
;;      (delete-region (match-beginning 0) (match-end 0))
;;      (muse-insert-markup start)
;;      (insert
;;       (propertize
;;       "<span class=\"toplink\"><a href=\"#top\">top</a></span>"
;;       'rear-nonsticky '(read-only) 'read-only t))
;;      (end-of-line)
;;      (when end
;;        (muse-insert-markup end))
;;      (muse-publish-section-close len)))

;; (defalias 'muse-publish-markup-heading 'ywb/muse-publish-markup-heading)

