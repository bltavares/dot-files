;;; config.ui --- Package
;;; Commentary:
;;; Code:
(require 'linum)
(require 'relative-line-numbers)

(load-theme 'sanityinc-tomorrow-night t)

(menu-bar-showhide-tool-bar-menu-customize-disable)
(setq inhibit-splash-screen t)
(setq tool-bar-mode -1
      scroll-bar-mode -1)

(show-paren-mode t)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(add-hook 'prog-mode-hook 'global-relative-line-numbers-mode)

(fset 'yes-or-no-p 'y-or-n-p) ;; Keep the questions short

;; use only spaces and no tabs
(setq-default indent-tabs-mode nil)
(setq
 tab-width 2
 standard-indent 2)
(blink-cursor-mode -1)

;; don't create backup~ or #auto-save# files
(setq backup-by-copying t
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

(defun my-relative-line-number-formatter (offset)
  "Format the relative line number using the linum-format.
Return the absolute value of OFFSET as string"
  (format linum-format (abs offset)))

(setq
 linum-format " %2d\u2502"
 relative-line-numbers-format 'my-relative-line-number-formatter)

(require 'uniquify)
(setq
 ;; When having windows with repeated filenames, uniquify them
 ;; by the folder they are in rather those annoying <2>,<3>,.. etc
 uniquify-buffer-name-style 'forward
 ;; don't screw special buffers
 uniquify-ignore-buffers-re "^\\*")

(require 'smooth-scroll)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(provide 'config.ui)
;;; config.ui ends here
