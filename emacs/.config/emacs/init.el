;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; update packages list if we are on a new install
(unless package-archive-contents
    (package-refresh-contents))

;; Initialize use-package on non linux platforms
(unless (package-installed-p 'use-package)
    (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Theme customization
(add-hook 'after-init-hook
    (lambda () (load-theme 'gruber-darker t)))

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(load-file "~/.config/emacs/.emacs.rc/config.el")
(load-file "~/.config/emacs/.emacs.rc/functions.el")

; evil mode
(use-package evil
    :init
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-want-C-u-scroll t)
    (setq evil-want-C-i-jump nil)
    :config
    (evil-mode 1)
    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
    (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

    ;; Use visual line motions even outside of visual-line-mode buffers
    (evil-global-set-key 'motion "j" 'evil-next-visual-line)
    (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

    (evil-set-initial-state 'messages-buffer-mode 'normal)
    (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

;; which-key
(use-package which-key
    :init (which-key-mode)
    :diminish which-key-mode
    :config (setq which-key-idle-delay 1))

;; Vertico completion
(use-package vertico
    :ensure t
    :bind
        (:map vertico-map
            ("C-j" . vertico-next)
            ("C-k" . vertico-previous)
            ("C-f" . vertico-exit))
        (:map minibuffer-local-map
            ("M-h" . backward-kill-word))
    :custom (vertico-cycle t)
    :init (vertico-mode))

;; Remember minibuffer prompt history
(use-package savehist
    :init (savehist-mode))

;; lsp-mode
(use-package lsp-mode
    :commands (lsp lsp-deferred)
    :hook (lsp-mode . lsp-enable-which-key-integration)
    :init (setq lsp-keymap-prefix "C-c l")
    :config
    (lsp-enable-which-key-integration t)
    ;; Performance
    (setq gc-cons-threshold 100000000)
    (setq lsp-completion-provider :capf)
    (setq lsp-idle-delay 0.500)
    (setq lsp-log-io nil)
    ;; Annoying lsp stuff
    (setq lsp-headerline-breadcrumb-enable nil)
    (setq lsp-enable-links nil)
    (setq lsp-signature-render-documentation nil)
    (setq lsp-ui-doc-enable nil)
    (setq lsp-completion-enable-additional-text-edit nil)
    (setq web-mode-enable-current-element-highlight t))


;; lsp-ui
(use-package lsp-ui
    :hook (lsp-mode . lsp-ui-mode)
    :custom
    (lsp-ui-doc-position 'bottom)
    (lsp-ui-sideline-show-diagnostics t)
    (lsp-ui-sideline-show-code-actions t)
    (lsp-ui-sideline-show-hover nil))

;; company
(use-package company
    :after
    lsp-mode
    :hook
    (lsp-mode . company-mode)
    :bind
    (:map company-active-map ("<tab>" . company-complete-selection))
    (:map lsp-mode-map ("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))

;; company-box
(use-package company-box
    :hook (company-mode . company-box-mode))

;; Dired
(setq dired-listing-switches "-agho --group-directories-first")
(setq dired-kill-when-opening-new-dired-buffer t)

;; global hooks
(add-hook 'c-mode-hook 'rc/development-mode)
(add-hook 'emacs-lisp-mode-hook #'company-mode)
