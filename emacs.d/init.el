;;; init.el --- Package
;;; Commentary:
;;; Code:

(defconst config-folder
  "~/.emacs.d/config"
  "The folder where user configuration is stored")

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path config-folder)
(require 'config)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#1d1f21")))))
