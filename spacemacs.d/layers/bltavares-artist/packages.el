;;; packages.el --- artist layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Bruno Tavares <bruno@sparta>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:
;;; Code:

(defconst bltavares-artist-packages
  '((artist :location built-in)))

(defun bltavares-artist/toogle-emacs-state ()
  "Toggle emacs-state when `artist-mode' is toggled."
  (unless (eq dotspacemacs-editing-style 'emacs)
    (if artist-mode
        (unless (evil-emacs-state-p)
          (evil-emacs-state))
      (evil-exit-emacs-state))))

(defun bltavares-artist/init-artist ()
  ;; `artist-mode' utilizes the mouse, and works better in emacs state, so we
  ;; automatically toggle emacs state on/off together with artist-mode (unless
  ;; the editing style is emacs)
  (add-hook 'artist-mode-hook #'bltavares-artist/toogle-emacs-state)

  (spacemacs/set-leader-keys
    "aa" #'artist-mode))

;;; Packages.el ends here
