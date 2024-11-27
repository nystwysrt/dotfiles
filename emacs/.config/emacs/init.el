(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'no-error)

(setq inhibit-startup-message 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(column-number-mode 1)

;; Set up the visible bell
(setq visible-bell t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
