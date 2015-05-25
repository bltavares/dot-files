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
(require 'config.smartparens)
(require 'config.rust)
(require 'zoom-frm)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Clojure
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

(setq js-indent-level 2
      paradox-github-token t)

(define-key ctl-x-map [(control ?+)] 'zoom-in/out)
(define-key ctl-x-map [(control ?-)] 'zoom-in/out)
(define-key ctl-x-map [(control ?=)] 'zoom-in/out)
(define-key ctl-x-map [(control ?0)] 'zoom-in/out)

;;Mac only
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'config)
;;; config ends here
