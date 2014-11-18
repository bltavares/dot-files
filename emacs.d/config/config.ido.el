;;; config.ido --- Package
;;; Commentary:
;;; Code:
(require 'ido)

(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always
      confirm-nonexistent-file-or-buffer nil)

(provide 'config.ido)
;;; config.ido ends here
