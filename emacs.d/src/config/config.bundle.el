(defun real-path (name)
  (and (not (equal name ".")) (not (equal name ".."))))

(let ((themes-directory "~/.emacs.d/themes/"))
  (when (file-directory-p themes-directory)
    (dolist (f (directory-files themes-directory))
      (when (real-path f)
        (add-to-list 'custom-theme-load-path (concat themes-directory f))))))

(let ((default-directory "~/.emacs.d/bundle/"))
  (dolist (f (directory-files default-directory))
    (when (real-path f)
      (add-to-list 'load-path (concat default-directory f))))
  (dolist (f (directory-files default-directory))
    (when (real-path f)
      (require (intern f)))))

(provide 'config.bundle)
