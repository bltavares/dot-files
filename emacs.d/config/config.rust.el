;;; config.rust --- Package
;;; Commentary:
;;; Code:

(require 'company-racer)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-racer))

(unless (getenv "RUST_SRC_PATH")
  (setenv "RUST_SRC_PATH" (expand-file-name "~/repos/rust/src")))

(add-hook 'rust-mode-hook #'company-mode)

(provide 'config.rust)
;;; config.rust ends here
