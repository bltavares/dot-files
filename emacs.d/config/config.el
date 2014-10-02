(require 'config.ui)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Clojure
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-filename-at-point 'guess)

;;Mac only
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'config)
