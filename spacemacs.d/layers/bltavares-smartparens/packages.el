;;; packages.el --- bltavares-smartparens layer packages file for Spacemacs.
;;; Commentary:
;;; Code:

(defconst bltavares-smartparens-packages
  '())

(defmacro slurp-or-barf-on-open-sexp (on-open on-other)
  "Slurp or Barf sexp depending if it is on the beggining of the sexp.
Execute ON-OPEN when point is in an open pair and ON-OTHER on other parts of sexp"
  `(lambda ()
     (interactive)
     (let ((current-point (char-to-string (char-after))))
       (if (--any? (string= (car it) current-point) sp-pair-list)
           (progn
             (sp-down-sexp)
             (,on-open))
         (,on-other)))))

;; (evil-leader/set-key
  ;; "<" (slurp-or-barf-on-open-sexp sp-backward-slurp-sexp sp-forward-barf-sexp)
  ;; ">" (slurp-or-barf-on-open-sexp sp-backward-barf-sexp sp-forward-slurp-sexp)
  ;; "J" 'sp-join-sexp
  ;; "O" 'sp-split-sexp
  ;; "S" 'sp-splice-sexp
  ;; "<down>" 'sp-splice-sexp-killing-backward
  ;; "<up>" 'sp-splice-sexp-killing-forward)


;;; packages.el ends here
