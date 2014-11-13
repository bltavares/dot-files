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

(provide 'config.ui)
