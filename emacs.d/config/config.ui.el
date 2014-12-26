;;; config.ui --- Package
;;; Commentary:
;;; Code:
(menu-bar-showhide-tool-bar-menu-customize-disable)
(setq inhibit-splash-screen t)
(scroll-bar-mode -1)

(show-paren-mode t)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(add-hook 'prog-mode-hook 'global-relative-line-numbers-mode)

(load-theme 'solarized-dark t)

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
