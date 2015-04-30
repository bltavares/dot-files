;;; config.hunspell --- Package
;;; Commentary:
;;; Code:
(require 'ispell)

(setq ispell-local-dictionary-alist '(
                                      ("brasileiro"
                                       "[[:alpha:]]"
                                       "[^[:alpha:]]"
                                       "[']"
                                       t
                                       ("-d" "pt_BR"); Dictionary file name
                                       nil
                                       utf-8)

                                      ("english"
                                       "[[:alpha:]]"
                                       "[^[:alpha:]]"
                                       "[']"
                                       t
                                       ("-d" "en_US")
                                       nil
                                       iso-8859-1)))

(setq ispell-program-name "hunspell"    ; Use hunspell to correct mistakes
      ispell-really-hunspell t
      ispell-dictionary   "english") ; Default dictionary to use

(add-to-list 'safe-local-variable-values
             '(eval ispell-change-dictionary "english"))
(add-to-list 'safe-local-variable-values
             '(eval ispell-change-dictionary "brasileiro"))

(require 'flyspell)
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(require 'evil)
(define-key evil-normal-state-map (kbd "]s") 'flyspell-goto-next-error)

(provide 'config.hunspell)
;;; config.hunspell ends here
