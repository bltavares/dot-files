;;; config.flycheck --- Summary
;;; Commentary:
;;; Code:
(require 'flycheck)

(global-flycheck-mode t)
(add-hook 'flycheck-mode-hook #'flycheck-cask-setup)

(provide 'config.flycheck)
;;; config.flycheck ends here
