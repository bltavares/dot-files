;;; packages.el --- bltavares-neotree layer packages file for Spacemacs.

;;; Commentary:

;;; Code:

(defconst bltavares-neotree-packages
  '(neotree))

(defun bltavares-neotree/keymap ()
  (evilified-state-evilify neotree-mode neotree-mode-map
    (kbd "o")   #'neotree-enter))

(defun bltavares-neotree/post-init-neotree ()
  (use-package neotree
    :init
    (bltavares-neotree/keymap)
    :config
    (setq neo-theme 'nerd)))

;;; packages.el ends here
