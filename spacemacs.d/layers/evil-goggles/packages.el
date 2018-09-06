;;; packages.el --- evil-goggles layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: fiveNinePlusR <fiveNinePlusR>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; This layer adds the evil-goggles package that briefly highlights user actions in evil mode

(defconst evil-goggles-packages
  '(evil-goggles))

(defun evil-goggles-mode--restart-evil-goggles ()
  (if evil-goggles-mode
      (progn
        (evil-goggles-mode -1)
        (evil-goggles-mode))))

(defun evil-goggles/post-init-evil-goggles ()
  (use-package evil-goggles
    :ensure t
    :config
    (spacemacs|add-toggle evil-goggles
      :mode evil-goggles-mode
      :on-message "evil-goggles-mode enabled"
      :documentation "visual feedback for evil commands"
      :evil-leader "tGg")

    (spacemacs|add-toggle evil-goggles-diff-faces
      :on (progn
            (evil-goggles-use-diff-faces)
            (evil-goggles-mode--restart-evil-goggles)
            )
      :off (evil-goggles-mode--restart-evil-goggles)
      :on-message "evil-goggles-diff-faces enabled"
      :documentation "Toggles using the diff faces for visual feedback in evil mode"
      :evil-leader "tGd")

    (evil-goggles-mode)
    (evil-goggles-use-diff-faces)))
;;; packages.el ends here
