;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs-core
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; To reload use <SPC f e R>
     ;; ----------------------------------------------------------------
     better-defaults
     emacs-lisp
     markdown
     org
     syntax-checking
     python
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t)

  (when (spacemacs/system-is-mac)
      (push 'osx dotspacemacs-configuration-layers)))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   ;; Updates
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-verbose-loading nil
   dotspacemacs-loading-progress-bar t

   ;; Startup
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists nil
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode

   ;; UI
   dotspacemacs-active-transparency 90
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-inactive-transparency 90
   dotspacemacs-line-numbers 'relative
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-themes '(sanityinc-tomorrow-night
                         sanityinc-tomorrow-day
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; Experience
   dotspacemacs-editing-style 'vim
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key nil ;; disabled to retrieve behaviour of , from Vi
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-smartparens-strict-mode nil

   ;; Layout
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil

   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5

   ;; Helm
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom

   ;; Others

   ;; TODO Search this
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
