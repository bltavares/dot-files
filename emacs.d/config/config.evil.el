(require 'evil)
(require 'evil-leader)
(require 'evil-jumper)
(require 'evil-numbers)
(require 'evil-surround)

(global-evil-surround-mode t)
(global-evil-leader-mode t)
(evil-mode t)

(define-key evil-normal-state-map (kbd "C-6") 'evil-buffer) ; CTRL-^ and CTRL-6 are the same on vim

(add-hook 'evil-insert-state-entry-hook
	  (lambda ()
	    (relative-line-numbers-mode -1)
	    (linum-mode t)))

(add-hook 'evil-insert-state-exit-hook
	  (lambda ()
	    (linum-mode -1)
	    (relative-line-numbers-mode t)))

(provide 'config.evil)
