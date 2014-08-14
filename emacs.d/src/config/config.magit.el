(add-to-list 'load-path "~/.emacs.d/src/git-modes")
(add-to-list 'load-path "~/.emacs.d/src/magit")

(eval-after-load 'info
                 '(progn  (info-initialize)
                          (add-to-list 'Info-directory-list "~/.emacs.d/src/magit")))
(require 'magit)
(provide 'config.magit)
