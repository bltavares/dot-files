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
