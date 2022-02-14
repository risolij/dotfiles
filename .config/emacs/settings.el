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

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package perspective
  :ensure t
  :bind
  (
    ("C-x C-b" . persp-list-buffers)
  )
  :config
  (persp-mode))

(use-package exwm
  :ensure t
  :config
  (require 'exwm-config)
  (server-start)
  (setq exwm-workspace-number 1))

(add-to-list 'load-path "~/.config/emacs/lisp/")

(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(use-package s
  :ensure t)

(load "org-bars")
(require 'org-bars)
(setq org-bars-extra-pixels-height 20)
(setq org-bars-with-dynamic-stars-p t)
(setq org-bars-stars '(
    :empty "*"
    :invisible "+"
    :visible "-"))

(defun org-no-ellipsis-in-headlines ()
  "Remove use of ellipsis in headlines.
See `buffer-invisibility-spec'."
  (remove-from-invisibility-spec '(outline . t))
  (add-to-invisibility-spec 'outline))

(add-hook 'org-mode-hook 'org-no-ellipsis-in-headlines)
(add-hook 'org-mode-hook #'org-bars-mode)

(global-hl-line-mode t)
(set-face-background 'hl-line "#25262B")

;; (global-visual-line-mode 1)

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
  (setq dashboard-startup-banner "/home/req/Pictures/logos/logo.png")
  (setq dashboard-set-init-info t)
  (setq dashboard-set-footer t)
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
    `((
       (,(all-the-icons-octicon "mark-github" :height 0.9 :v-adjust 0.0)
              "Homepage"
              "Browse homepage"
              (lambda (&rest _) (browse-url "https://github.com/risolij/dotfiles")))

       (,(all-the-icons-faicon "youtube-play" :height 0.9 :v-adjust 0.0)
              "Youtube"
              "Probably watch gingergm"
              (lambda (&rest _) (browse-url "https://youtube.com")))

       (,(all-the-icons-faicon "sticky-note" :height 0.9 :v-adjust 0.0)
              "Notes"
              "Notes file"
              (lambda (&rest _) (find-file "~/org/notes.org")))

       (,(all-the-icons-octicon "gear" :height 0.9 :v-adjust 0.0)
              "Configuration"
              "Click to config Emacs"
              (lambda (&rest _) (find-file "~/org/dev/git/dotfiles/.config/emacs/settings.org"))))))
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

(set-face-attribute 'default nil :font "Inconsolata-14" )

(use-package fontawesome
  :ensure t)

;; (use-package org-superstar
;;   :ensure t
;;   :hook (org-mode . (lambda () (org-superstar-mode 1)))
;;   :config
;;   (setq org-superstar-headline-bullets-list (fontawesome "square-caret-right"))
;;   ;;(setq org-superstar-headline-bullets-list (fontawesome "gear"))
;;   (setq org-superstar-special-todo-items t)
;;   (setq org-superstar-todo-bullet-alist
;;       '(
;;         ("TODO" "")
;;         ("NEXT" "✒")
;;         ("WAIT" "☕")
;;         ("CXLD" "✘")
;;         ("DONE" "✔")
;;        )))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package writeroom-mode
  :ensure t
  :hook org-mode)

(setq org-startup-folded t)

(setq org-src-fontify-natively t)
(setq org-src-window-setup 'current-window)
(setq org-edit-src-content-indentation 0)
(setq org-src-strip-leading-and-trailing-blank-lines t)
(setq org-src-preserve-indentation nil)
(setq org-src-tab-acts-natively t)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'org-mode-hook 'flycheck-mode))

(use-package flycheck-grammarly
  :ensure t
  :after flycheck
  :config
  (setq flycheck-grammarly-check-time 0.8)
  (add-to-list 'flycheck-checkers 'grammarly))
