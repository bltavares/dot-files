;;; config --- Package
;;; Commentary:
;;; Code:

(require 'config.ui)
(require 'config.ido)
(require 'config.evil)
(require 'config.flycheck)
(require 'config.powerline)
(require 'config.magit)
(require 'config.org)
(require 'smartparens-config)
(require 'config.hunspell)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Clojure
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

(setq js-indent-level 2
      paradox-github-token t)

;;Mac only
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'config)
;;; config ends here
