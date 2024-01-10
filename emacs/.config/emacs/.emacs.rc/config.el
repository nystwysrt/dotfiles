;; Dont show splash screen
(setq-default inhibit-startup-message t)
(setq-default initial-scratch-message "")
(kill-buffer "*Messages*")

;; Turn off some unneeded UI elements
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)
(show-paren-mode t)

;; Disable bell notification
(setq-default visible-bell nil)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
        (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Set fonts
(set-face-attribute 'default nil :font "JetBrainsMonoNerdFont" :height 120)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMonoNerdFont" :height 120)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "JetBrainsMonoNerdFont" :height 120 :weight 'regular)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Display line numbers in every buffer
(global-display-line-numbers-mode t)

;; Highlight the current line
(global-hl-line-mode 1)

;; Blink the cursor
(blink-cursor-mode 1)

;; Remembering recently edited files
(recentf-mode 1)

;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

;; Dont pop up UI dialogs when prompting
(setq use-dialog-box nil)

;; Revert buffers when the underlying file has changed
(setq global-auto-revert-mode 1)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; 'y' for 'yes', 'n' for 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Auto indent after return
(global-set-key (kbd "RET") 'newline-and-indent)

;; Tabs
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
