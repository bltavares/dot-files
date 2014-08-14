(require 'config.org-mode)
(require 'config.magit)
(require 'config.bundle)
(require 'config.ui)

(global-rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'electric-pair-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

;;Mac only
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'config)
