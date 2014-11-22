;;; config.flycheck --- Summary
;;; Commentary:
;;; Code:
(require 'flycheck)

(global-flycheck-mode t)
(add-hook 'flycheck-mode-hook 'flycheck-cask-setup)
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (add-to-list 'flycheck-emacs-lisp-load-path config-folder)))

(provide 'config.flycheck)
;;; config.flycheck ends here
