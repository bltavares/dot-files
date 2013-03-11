(let ((default-directory "~/.emacs.d/bundle/"))
  (dolist (f (directory-files default-directory))
    (when (and (not (equal f ".")) (not (equal f "..")))
      (add-to-list 'load-path (concat default-directory f))
      (require (intern f))
      )))

(let ((themes-directory "~/.emacs.d/themes/"))
  (when (file-directory-p themes-directory) 
    (dolist (f (directory-files themes-directory))
      (when (and (not (equal f ".")) (not (equal f "..")))
        (add-to-list 'custom-theme-load-path (concat themes-directory f))
        ))))

(load-theme 'solarized-dark t)
(global-rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'electric-pair-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

;;Mac only
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
