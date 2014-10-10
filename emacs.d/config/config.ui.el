(menu-bar-showhide-tool-bar-menu-customize-disable)
(setq inhibit-splash-screen t)
(scroll-bar-mode -1)

(show-paren-mode t)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(global-linum-mode t)

(load-theme 'solarized-dark t)

(fset 'yes-or-no-p 'y-or-no-p) ;; Keep the questions short

(provide 'config.ui)
