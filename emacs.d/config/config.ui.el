(menu-bar-showhide-tool-bar-menu-customize-disable)
(setq inhibit-splash-screen t)
(scroll-bar-mode -1)

(show-paren-mode 1)

(load-theme 'solarized-dark t)

(fset 'yes-or-no-p 'y-or-no-p) ;; Keep the questions short

(provide 'config.ui)
