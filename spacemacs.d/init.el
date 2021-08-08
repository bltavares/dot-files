;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/system-is-mac ()
  (eq system-type 'darwin))

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(windows-scripts
     html
     ;; windows-scripts
     ;; ----------------------------------------------------------------
     ;; To reload use <SPC f e R>
     ;; ----------------------------------------------------------------
     better-defaults
     syntax-checking
     ;; Parinfer is too buggy on this codebases
     ;; parinfer
     (spell-checking :variables
                     spell-checking-enable-auto-dictionary t
                     ispell-dictionary "english"
                     ispell-local-dictionary-alist '(("brasileiro"
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
                                                      iso-8859-1))
                     enable-flyspell-auto-completion t)
     gtags

     ivy ;; Replace helm with ivy
     lsp

     auto-completion
     (typescript :variables
                 typescript-fmt-on-save t
                 standard-indent 2
                 typescript-indent-level 2
                 typescript-backend 'tide
                 tide-tsserver-executable "/usr/local/bin/tsserver")

     ;; Langs
     emacs-lisp
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-babel-load-languages '((shell . t) (emacs-lisp . t)))
     ;; clojure
     ;; nu-clojure
     ;; elm
     (terraform :variables terraform-auto-format-on-save t)
     (javascript :variables
                 js-indent-level 2
                 javascript-backend 'lsp)
     react
     ;; python
     ruby
     rust
     (shell-scripts :variables
                    sh-basic-offset 2
                    sh-indentation 2)
     markdown
     yaml
     graphviz
     ;; go
     kotlin
     (dart :variables
                     dart-sdk-path "/Users/bruno/flutter/bin/cache/dart-sdk/"
                     dart-format-on-save t
                     dart-enable-analysis-server t)
     git
     github

     ;; Personal
     bltavares-vim
     bltavares-linum
     bltavares-neotree
     bltavares-artist
     (bltavares-dart :variables
                     dart-sdk-path "/Users/bruno/flutter/bin/cache/dart-sdk/"
                     dart-format-on-save t
                     dart-enable-analysis-server t)
     (evil-goggles :variables
                   evil-goggles-duration 0.100)
     )

   dotspacemacs-additional-packages '(toc-org)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only)

  (when (dotspacemacs/system-is-mac)
    (push 'osx dotspacemacs-configuration-layers)))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Updates
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 10
   dotspacemacs-verify-spacelpa-archives nil
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil

   ;; Startup
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists nil
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(sanityinc-tomorrow-night
                         spacemacs-dark
                         sanityinc-tomorrow-day
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Monaco"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; Experience
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil

   ;; Layout
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 1

   ;; Helm
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always

   ;; Others
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols (if (dotspacemacs/system-is-mac) t nil)
   dotspacemacs-mode-line-theme 'spacemacs
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil

   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup 'trailing
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer-elpa-archives)
  (push '(cider . "melpa-stable") package-pinned-packages)
)

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Disable headings with different sizes on Spacemacs theme
  (setq spacemacs-theme-org-height nil)
  (setq powerline-default-separator nil)
  (setq create-lockfiles nil)

  (with-eval-after-load
    (fset 'evil-visual-update-x-selection 'ignore)
    (spaceline-compile))

  (setq frame-resize-pixelwise t)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ox-gfm graphviz-dot-mode evil-unimpaired f s dash color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets yaml-mode ws-butler winum wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen unfill toml-mode toc-org tide typescript-mode tagedit symon string-inflection spaceline-all-the-icons spaceline powerline smex smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters racer pug-mode popwin persp-mode password-generator paradox ox-reveal overseer orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-bullets org-brain open-junk-file neotree nameless mwim move-text minitest markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum livid-mode skewer-mode linum-relative link-hint less-css-mode kotlin-mode json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc ivy-yasnippet ivy-xref ivy-purpose window-purpose imenu-list ivy-hydra insert-shebang indent-guide impatient-mode simple-httpd hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-make helm helm-core haml-mode google-translate golden-ratio gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags fuzzy flyspell-popup flyspell-correct-ivy flyspell-correct flycheck-rust flycheck-pos-tip pos-tip flycheck-kotlin flycheck-bashate flycheck flx-ido flx fish-mode fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit ghub async treepy graphql with-editor evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-goggles evil-exchange evil-escape evil-cleverparens smartparens paredit evil-args evil-anzu anzu eval-sexp-fu highlight emmet-mode elisp-slime-nav editorconfig dumb-jump define-word counsel-projectile counsel-gtags company-web web-completion-data company-terraform terraform-mode hcl-mode company-tern dash-functional tern company-statistics company-shell company column-enforce-mode clean-aindent-mode chruby centered-cursor-mode cargo markdown-mode rust-mode bundler inf-ruby auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed aggressive-indent ace-window ace-link avy ac-ispell auto-complete popup counsel swiper ivy projectile pkg-info epl all-the-icons memoize which-key use-package pcre2el org-plus-contrib hydra dotenv-mode diminish bind-map bind-key evil goto-chg ox-gfm graphviz-dot-mode evil-unimpaired f s dash color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed)))))
)
