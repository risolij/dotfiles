(use-package evil
  :ensure t
  :defer .1
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  (setq-default evil-auto-indent nil)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd ":") 'evil-repeat-find-char)
    (define-key evil-motion-state-map (kbd "<SPC>") 'evil-ex)
    (define-key evil-motion-state-map (kbd "f") 'helm-find-files))
  :config
  (evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :custom
  (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(require 'org-tempo)

(setq make-backup-files nil)

(setq org-file-apps
      '((auto-mode . emacs)
        ("\\(?:xhtml\\|html\\)\\'" . "firefox %s")))

(use-package magit
  :ensure t)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package ox-reveal
  :ensure t)

(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  ;;(define-key evil-ex-map "e" 'helm-find-files)
  (setq-default helm-M-x-fuzzy-match t)
  (setq helm-split-window-in-side-p t)
  (setq helm-move-to-line-cycle-in-source t))

(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(global-visual-line-mode 1)

(use-package all-the-icons
  :ensure t
  :config
  (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append))

(use-package dashboard
  :init
  (setq dashboard-banner-logo-title "")
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner "/home/req/Pictures/logos/lambda.png")
  (setq dashboard-set-navigator nil)
  (setq dashboard-set-init-info nil)
  (setq dashboard-set-footer nil)
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
 doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(add-to-list 'default-frame-alist
   '(font . "Inconsolata-20"))

(use-package fontawesome
  :ensure t)

(use-package org-superstar
  :ensure t
  :config
  (setq org-superstar-headline-bullets-list (fontawesome "gear"))
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package writeroom-mode
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (writeroom-mode 1))))

(setq org-startup-folded t)

(setq org-src-fontify-natively t
  org-src-window-setup 'current-window
  org-edit-src-content-indentation 0
  org-src-strip-leading-and-trailing-blank-lines t
  org-src-preserve-indentation nil
  org-src-tab-acts-natively t)
