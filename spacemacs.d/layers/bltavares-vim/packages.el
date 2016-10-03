;;; packages.el --- bltavares-ui layer packages file for Spacemacs.

;;; Commentary:

;;; Code:

(defconst bltavares-vim-packages
  '(flycheck))

;; Define missing vim keys
;(define-key evil-normal-state-map (kbd "C-6") 'evil-buffer)
;(define-key evil-motion-state-map (kbd "C-6") 'evil-buffer)
;(define-key evil-normal-state-map (kbd "C-w q") 'evil-window-delete)
;(define-key evil-motion-state-map (kbd "C-w q") 'evil-window-delete)

;; (define-key evil-insert-state-map (kbd "<tab>") #'company-complete)
;; (evil-leader/set-key
;;   "p" #'neotree-toggle
;;   "o" #'neotree-project-dir
;;   "f" #'fiplr-find-file
;;   "b" #'ido-switch-buffer)

;; Define missing vim command
(defun bltavares-vim/post-init-flycheck ()
  (use-package flycheck
    :config
    (evil-ex-define-cmd "Errors" #'flycheck-list-errors)))

;(evil-ex-define-cmd "retab" #'untabify)

;;; packages.el ends here
