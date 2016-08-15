;;; packages.el --- bltavares layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Bruno Tavares <bruno@sparta>
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
;; added to `bltavares-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `bltavares/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `bltavares/pre-init-PACKAGE' and/or
;;   `bltavares/post-init-PACKAGE' to customize the package as it is loaded.

;(show-paren-mode t)
;(line-number-mode t)
;(column-number-mode t)
;(size-indication-mode t)
;(show-paren-mode t)
;(setq
 ;tab-width 2
 ;standard-indent 2)
;(define-key evil-normal-state-map (kbd "C-6") 'evil-buffer)
;(define-key evil-motion-state-map (kbd "C-6") 'evil-buffer)
;(define-key evil-normal-state-map (kbd "C-w q") 'evil-window-delete)
;(define-key evil-motion-state-map (kbd "C-w q") 'evil-window-delete)
;(evil-ex-define-cmd "Errors" 'flycheck-list-errors)

;(evil-leader/set-key
  ;"p" #'neotree-toggle
  ;"o" #'neotree-project-dir
  ;"f" #'fiplr-find-file
  ;"b" #'ido-switch-buffer)

;(add-hook 'evil-insert-state-entry-hook
          ;(lambda ()
            ;(relative-line-numbers-mode -1)
            ;(linum-mode t)))

;(add-hook 'evil-insert-state-exit-hook
          ;(lambda ()
            ;(linum-mode -1)
            ;(relative-line-numbers-mode t)))

;(add-hook 'neotree-mode-hook
          ;(lambda ()
            ;(define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            ;(define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
            ;(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            ;(define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            ;(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;(defun my-relative-line-number-formatter (offset)
  ;"Format the relative line number using the linum-format.
;Return the absolute value of OFFSET as string"
  ;(format linum-format (abs offset)))

;(setq
 ;linum-format " %2d\u2502"
 ;relative-line-numbers-format 'my-relative-line-number-formatter)

;(setq neo-theme 'ascii)




;;; Code:

(defconst bltavares-packages
  '()
  "The list of Lisp packages required by the bltavares layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;;; packages.el ends here
