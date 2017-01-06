(defun my-initialize ()
  (setq-default
   dotspacemacs-configuration-layers
   '(
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     (markdown :variables markdown-live-preview-engine 'vmd)
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'term)
     spell-checking
     syntax-checking
     version-control
     (ruby :variables
           ruby-enable-ruby-on-rails-support t
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)
     ruby-on-rails
     yaml
     javascript
     html
     )
   dotspacemacs-default-font '("Ricty Diminished-15"
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ))

(provide 'my-initialize)
