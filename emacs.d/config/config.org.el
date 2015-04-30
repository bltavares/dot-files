;;; config.org.el --- Package
;;; Commentary:
;;; Code:

(require 'org)
(require 'ob)
(require 'ox-gfm)

(setq
 org-completion-use-ido t
 org-src-fontify-natively t
 org-babel-clojure-backend 'cider)

(provide 'config.org)
;;; config.org ends here
