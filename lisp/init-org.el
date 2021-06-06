;;; init-org --- settings for orgmode -*- coding: utf-8; lexical-binding: t; -*-

;;; Commentary:

;; org-mode settting
;; refer https://github.com/emacs-tw/awesome-emacs#org-mode

;;; Code:

(require 'org)
;; hide leading stars does not work well with themes
;; (use-package org-bullets
;;   :ensure t
;;   :hook (org-mode . org-bullets-mode))

;; disable electric-indent-mode for orgmode
(use-package org
  :ensure nil
  :config
  ;; disable leading indent in code block
  ;; https://stackoverflow.com/questions/53469017/org-mode-source-editing-indents-code-after-exiting-source-code-block-editor
  (setq org-edit-src-content-indentation 0
      org-src-preserve-indentation nil)

  ;; ;; activate default key-bindings
  ;; ;; https://orgmode.org/manual/Activation.html
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)

  (add-hook 'org-mode-hook (lambda()
			     (electric-indent-local-mode -1))))

;; vimrc-mode - Enables syntax highlighting for .vimrc/_vimrc files
;; https://github.com/mcandre/vimrc-mode
(use-package vimrc-mode
  :ensure t
  :mode ("\\.vim\\(rc\\)?\\'" . vimrc-mode)
  :defer)

;; David O'Toole Org tutorial
;; https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(setq org-log-done t)

;; set `org-agenga-files'
;; https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
(setq org-agenda-files '("~/workshop/org"))


;; set tangled parent directory for each subtree
;; https://emacs.stackexchange.com/questions/46479/how-to-set-a-tangled-parent-directory-for-each-subtree-in-org-mode
(defun org-in-tangle-dir (sub-path)
  "Expand the SUB-PATH into the directory given by the tangle-dir property.
if that property does not exist, use the `default-directory'."
  (expand-file-name sub-path
		    (or
		     (org-entry-get-with-inheritance "tangle-dir")
                     default-directory)))

(use-package htmlize
  :ensure t)

;; http://0x100.club/wiki_emacs/highlight-code.html
;; https://stackoverflow.com/questions/36930253/org-mode-controlling-html-output-of-code-blocks
(defun org-html-src-block2 (src-block _contents info)
  "Transcode a SRC-BLOCK element from Org to HTML.
CONTENTS holds the contents of the item.  INFO is a plist holding
contextual information."
  (if (org-export-read-attribute :attr_html src-block :textarea)
      (org-html--textarea-block src-block)
    (let ((lang (org-element-property :language src-block))
          (code (org-html-format-code src-block info))
          (label (let ((lbl (and (org-element-property :name src-block)
                                 (org-export-get-reference src-block info))))
                   (if lbl (format " id=\"%s\"" lbl) ""))))
      (if (not lang) (format "<pre><code class=\"example\"%s>\n%s</code></pre>" label code)
        (format "<div class=\"container\">\n%s%s\n</div>"
                ;; Build caption.
                (let ((caption (org-export-get-caption src-block)))
                  (if (not caption) ""
                    (let ((listing-number
                           (format
                            "<span class=\"listing-number\"%s </span>"
                            (format
                             (org-html--translate "Listing %d:" info)
                             (org-export-get-ordinal
                              src-block info nil #'org-html--has-caption-p)))))
                      (format "<label class=\"org-src-name\">%s%s</label>"
                              listing-number
                              (org-trim (org-export-data caption info))))))
                ;; Contents.
                (format "<pre><code class=\"%s\"%s>%s</code></pre>"
                        lang label code))))))

(defun org-html-src-block-jekyll (src-block contents info)
  "Transcode a SRC-BLOCK element from Org to Jekyll highlight block.
CONTENTS holds the contents of the item.  INFO is a plist holding
contextual information."
  (if (org-export-read-attribute :attr_html src-block :textarea)
      (org-html--textarea-block src-block)
    (let ((lang (or (org-element-property :language src-block) ""))
          (code (org-html-format-code src-block info))
          (label (let ((lbl (and (org-element-property :name src-block)
                                 (org-export-get-reference src-block info))))
                   (if lbl (format " id=\"%s\"" lbl) ""))))
      ;; Build Rouge highlight code block
      (format "{%% highlight %s %%}\n%s\n{%% endhighlight %%}\n" lang code))))

(advice-add 'org-html-src-block :override 'org-html-src-block-jekyll)

;; github pages using org files
(setq org-publish-project-alist
      '(("gh-pages"
         ;; Path to org files.
         :base-directory "~/workshop/github/shohi/shohi.github.io/_org"
         :base-extension "org"

         ;; Path to Jekyll Posts
         :publishing-directory "~/workshop/github/shohi/shohi.github.io/_posts/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t
         )))

;; https://github.com/gongzhitaao/orgcss
(setq org-html-htmlize-output-type 'nil)
;; (setq org-html-head-include-default-style nil)


(provide 'init-org)
;;; init-org.el ends here
