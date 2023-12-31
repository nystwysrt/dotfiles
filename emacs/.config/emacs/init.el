;; Dont show the splash screen
(setq inhibit-startup-message t)
(setq visible-bell nil)

;; Turn off some unneeded UI elements
(menu-bar-mode 0)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; Highlight the current line
(global-hl-line-mode 1)

;; Blink the cursor
(blink-cursor-mode 1)

;; Remembering recently edited files
(recentf-mode 1)

;; Remember minibuffer prompt history
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Dont pop up UI dialogs when prompting
(setq use-dialog-box nil)

;; Revert buffers when the underlying file has changed
(setq global-auto-revert-mode 1)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Tabs
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; 'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Theme customization
(setq modus-themes-mode-line '(accented borderless padded)
      modus-themes-region '(bg-only)
      modus-themes-completions '(opiniotated)
      modus-themes-bold-constructs t
      modus-themes-paren-match '(bold intense)
      modus-themes-syntax '(yellow-comments))
(load-theme 'modus-vivendi t)
