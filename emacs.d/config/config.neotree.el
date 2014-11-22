;;; config.neotree.el --- Package
;;; Commentary:
;;; Code:

(require 'fiplr)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (fiplr-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (progn
          (save-excursion
            (neotree-dir project-dir))
          (neotree-find file-name))
      (message "Could not find git project root."))))

(provide 'config.neotree)
;;; config.neotree ends here
