;;; config.ui --- Package
                                        ; Commentary:
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

(require 'smooth-scroll)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(provide 'config.ui)
;;; config.ui ends here
