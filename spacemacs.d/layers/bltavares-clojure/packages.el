;;; packages.el --- bltavares-clojure layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Bruno Tavares <bruno@work-blt.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `bltavares-clojure-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `bltavares-clojure/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `bltavares-clojure/pre-init-PACKAGE' and/or
;;   `bltavares-clojure/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst bltavares-clojure-packages
  '())

(defun set-work-clj-indent ()
  "Reset midje indent to default."
  (define-clojure-indent
    (against-background 1)
    (as-customer 1)
    (as-of 1)
    (assoc 1)
    (fact 1)
    (facts 1)
    (flow 1)
    (let-entities 3)
    (provided 0)))

(add-hook 'clojure-mode-hook #'set-work-clj-indent)
;;; packages.el ends here
