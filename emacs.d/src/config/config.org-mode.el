;;Org mode
(add-to-list 'load-path "~/.emacs.d/src/org-mode/contrib/lisp")
(add-to-list 'load-path "~/.emacs.d/src/org-mode/lisp")

(eval-after-load 'info
                 '(progn (info-initialize)
                         (add-to-list 'Info-directory-list "~/.emacs.d/src/org-mode/doc")))

(provide 'config.org-mode)
