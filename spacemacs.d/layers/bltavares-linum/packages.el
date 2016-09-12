;;; packages.el --- bltavares-linum layer packages file for Spacemacs.
;;; Code:

(defconst bltavares-linum-packages
  '(linum-relative))

(defconst bltavares-linum/format " %4s\u2502")

(defun bltavares-linum/relative->linum ()
  (linum-relative-mode -1)
  (linum-mode t))

(defun bltavares-linum/linum->relative ()
  (linum-mode -1)
  (linum-relative-mode t))

(defun bltavares-linum/post-init-linum-relative ()
  (use-package linum-relative
    :init
    (progn
      (add-hook 'evil-insert-state-entry-hook
                #'bltavares-linum/relative->linum)

      (add-hook 'evil-insert-state-exit-hook
                #'bltavares-linum/linum->relative))
    :config
    (setq linum-relative-user-format bltavares-linum/format
          linum-relative-format bltavares-linum/format)))


;;; packages.el ends here
