;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Basic Configurations

(server-start)

;;; Text Mode Menu
(defalias 'menu 'tmm-menubar)
(global-set-key (kbd "<f10>") 'menu)

;;; Smaller buffer movements
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
(setq scroll-conservatively 100)

;;; Clean start
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;;; Don't litter the file tree
(setq backup-directory-alist
      '((".*" . "/home/jacob/tmp/"))
      auto-save-file-name-transforms
      '((".*" "/home/jacob/tmp/" t)))

;;; Have dired hide hidden directories by default
;;; This is easily changed with C-u s
(setq dired-listing-switches "-lFh")

;;; Variables set thru custom interface
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(alchemist-goto-elixir-source-dir "/home/jacob/Source/elixir/")
 '(alchemist-goto-erlang-source-dir "/home/jacob/Source/otp/")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(battery-mode-line-format " %p %t")
 '(blink-matching-paren t)
 '(column-number-mode t)
 '(company-go-gocode-command "/home/jacob/go/bin/gocode")
 '(company-go-show-annotation t)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes '(manoj-dark))
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(erc-fill-column 90)
 '(erc-modules
   '(completion notifications spelling hl-nicks netsplit fill button match track readonly networks ring autojoin noncommands irccontrols move-to-prompt stamp menu list))
 '(erc-notifications-icon
   "/usr/share/icons/Adwaita/48x48/status/user-available-symbolic.symbolic.png")
 '(fci-rule-color "#073642")
 '(go-eldoc-gocode "/home/jacob/go/bin/gocode")
 '(go-fontify-function-calls t)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(inferior-lisp-program "sbcl" t)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(mu4e-maildir "/home/jacob/Maildir/Gmail")
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(openwith-associations
   '(("\\.pdf\\'" "mupdf"
      (file))
     ("\\.mp3\\'" "xmms"
      (file))
     ("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer"
      ("-idx" file))
     ("\\.\\(?:jp?g\\|png\\)\\'" "display"
      (file))))
 '(org-agenda-files '("~/org/gcal.org" "~/org/root.org"))
 '(org-archive-location ".archive.org::")
 '(org-capture-templates
   '(("g" "gcal" entry
      (file "~/org/gcal.org")
      "* %?
  %T" :time-prompt t)
     ("t" "todo" entry
      (file+headline "~/org/root.org" "Todo")
      "** TODO %? %^G
")
     ("n" "note" entry
      (file+headline "~/org/root.org" "Notes")
      "** %?
   - Note taken on %U
   - %a
")
     ("1" "Clock in Service Oriented Programming" entry
      (file "~/org/clock.org")
      "* Service Oriented Programming :vusop:" :immediate-finish t :clock-in t :clock-keep t)
     ("2" "Clock In Protocol Validation" entry
      (file "~/org/clock.org")
      "* Protocol Validation :vupv:" :immediate-finish t :clock-in t :clock-keep t)
     ("3" "Clock in Lambda Calculus" entry
      (file "~/org/clock.org")
      "* Lambda Calculus :uvalc:" :prepend t :clock-in t :clock-keep t)))
 '(org-confirm-babel-evaluate nil)
 '(org-datetree-add-timestamp 'inactive)
 '(org-default-notes-file "~/org/notes.org")
 '(org-indent-indentation-per-level 1)
 '(org-pretty-entities t)
 '(org-src-lang-modes
   '(("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . graphviz-dot)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("C++" . c++)
     ("screen" . shell-script)
     ("shell" . sh)
     ("bash" . sh)))
 '(package-selected-packages
   '(flycheck-golangci-lint flycheck-gometalinter flymake-go popwin company-go go-complete go-direx go-eldoc go-mode go-scratch company-erlang ox-gfm eimp graphviz-dot-mode notmuch netherlands-holidays djvu geiser racket-mode slime-company slime ruby-end ob-lfe lfe-mode company-inf-ruby enh-ruby-mode erlang alchemist elixir-mode openwith org-pdfview pdf-tools org-gcal bongo dired-rsync rainbow-mode easy-hugo org ace-window magithub request csv-mode elpy use-package-ensure-system-package pulseaudio-control solarized-theme smart-mode-line system-packages ledger-mode magit which-key erc-hl-nicks paredit-mode paredit use-package exwm "exwm"))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(pulseaudio-control-volume-step "5%")
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(solarized-height-minus-1 1.0)
 '(solarized-height-plus-1 1.0)
 '(solarized-height-plus-2 1.0)
 '(solarized-height-plus-3 1.0)
 '(solarized-height-plus-4 1.0)
 '(solarized-high-contrast-mode-line nil)
 '(solarized-scale-org-headlines nil)
 '(solarized-use-variable-pitch nil)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(text-scale-mode-step 1.1)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#c8805d801780")
     (60 . "#bec073400bc0")
     (80 . "#b58900")
     (100 . "#a5008e550000")
     (120 . "#9d0091000000")
     (140 . "#950093aa0000")
     (160 . "#8d0096550000")
     (180 . "#859900")
     (200 . "#66aa9baa32aa")
     (220 . "#57809d004c00")
     (240 . "#48559e556555")
     (260 . "#392a9faa7eaa")
     (280 . "#2aa198")
     (300 . "#28669833af33")
     (320 . "#279993ccbacc")
     (340 . "#26cc8f66c666")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))

;;; Faces set thru customize
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "mlss" :family "Anonymous Pro"))))
 '(font-lock-function-name-face ((t (:foreground "mediumspringgreen" :weight bold :height 1.0))))
 '(show-paren-match ((t (:background "steel blue")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Package Configuration

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ;; ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/"))
      use-package-verbose t
      use-package-always-ensure nil)


;; (package-initialize)
(package-install 'use-package)
;; (use-package use-package-ensure-system-package
;;   :ensure t)
;; (package-install 'exwm)

;;; The All-Important Theme
(load-theme 'manoj-dark)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; EXWM Configuration
(require 'exwm)

(require 'exwm-systemtray)
(setq exwm-systemtray-height 16)
(exwm-systemtray-enable)

;;; The default exwm config, copied to ~/.emacs.d/lisp/
;; (require 'exwm-config)
;; (exwm-config-default)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'my-exwm-config)
(exwm-config-custom)

(exwm-enable)

;; ;; 's-&': Launch application
;; (exwm-input-set-key (kbd "s-&")
;; 		    (lambda (command)
;; 		      (interactive (list (read-shell-command "$ ")))
;; 		      (start-process-shell-command command nil command)))

(global-set-key
 (kbd "C-c x")
 (lambda (command)
   (interactive (list (read-shell-command "$ ")))
   (start-process-shell-command command nil command)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Individual Package Configuration

(use-package system-packages
  :ensure t)

(use-package paredit-mode
  :init (use-package paredit :ensure t)
  :hook (emacs-lisp-mode lisp-mode))

;;; Don't keep irc config in VC since it has PWs
(load "my-erc")
;;; The keybinds were polluting my init!
(load "my-org")

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package magit
  :ensure t
  :init
  (use-package magithub :ensure t)
  :bind ("C-c g" . magit-status))

(use-package ledger-mode
  :ensure t
  :config
  (setq ledger-post-auto-adjust-amounts t))


(use-package smart-mode-line
  :ensure t
  :config
  ;; (setq display-time-format "%m-%d %R")
  ;; (setq battery-mode-line-format "[%b%p%% %t]")

  (setq sml/theme 'automatic
	sml/battery-format " %b%p%% %t "
	display-time-format " %m-%d %R ")
  (sml/setup)
  (setq battery-mode-line-format " %b%p%% %t "
  	display-time-format " %m-%d %R ")
  (display-time-mode)
  (display-battery-mode))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(use-package mu4e
  :defer t
  :ensure-system-package html2text
  :config
  (setq mu4e-html2text-command "html2text -utf8 -width 72"))

(use-package elpy
  :defer t
  :ensure t
  :init
  (add-hook 'python-mode-hook 'elpy-mode)
  (setq python-shell-interpreter "python3"
	elpy-rpc-python-command "python3"))

(use-package csv-mode
  :ensure t)
(use-package request
  :ensure t)
(use-package ace-window
  :ensure t
  :config
  (setq aw-scope 'frame)
  :bind ("C-x o" . 'ace-window))
(use-package easy-hugo
  :defer t
  :ensure t
  ;; :ensure-system hugo
  :bind ("C-c b" . 'easy-hugo)
  :config
  (setq easy-hugo-basedir "~/org/blog/"
	easy-hugo-default-ext ".org"))

(use-package rainbow-mode
  :ensure t
  :hook (css-mode))

;;; Power funcs
(defun shutdown (arg)
  (interactive "nMinutes: ")
  (shell-command (format "shutdown %d" arg) "*Messages*"))
(defun shutdown-now ()
  (interactive)
  (shell-command "shutdown now"))
(defun shutdown-cancel ()
  (interactive)
  (shell-command "shutdown -c"))
(defun suspend ()
  (interactive)
  (shell-command "systemctl suspend"))

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(use-package dired-rsync
  :ensure t
  :bind (:map dired-mode-map
	      ("Y" . 'dired-rsync)))
(use-package bongo :ensure t :defer t)

(defvar scrot-dir "/home/jacob/Pictures/scrot")
(defun scrot ()
  (interactive)
  (shell-command (concat "scrot -e 'mv $f " scrot-dir "'")))

(defun scrot-s ()
  (interactive)
  (shell-command (concat "scrot -s -e 'mv $f " scrot-dir "'")))

(defun celsius-to-fahrenheit (temp-c)
  (+ (* temp-c 1.8) 32))
(defun fahrenheit-to-celsius (temp-f)
  (/ (- temp-f 32) 1.8))

(use-package pdf-tools :ensure t
  :init
  (pdf-tools-install)
  (defun pdf-two-pages ()
    (interactive)
    (delete-other-windows)
    (split-window-right)
    (pdf-view-fit-width-to-window)
    (other-window 1)
    (pdf-view-fit-width-to-window)
    (pdf-view-next-page)
    (other-window 1))

  (defun pdf-two-page-next ()
    (interactive)
    (pdf-view-next-page)
    (pdf-view-next-page)
    (other-window 1)
    (pdf-view-next-page)
    (pdf-view-next-page)
    (other-window 1))

  (defun pdf-two-page-prev ()
    (interactive)
    (pdf-view-previous-page)
    (pdf-view-previous-page)
    (other-window 1)
    (pdf-view-previous-page)
    (pdf-view-previous-page)
    (other-window 1))

  :bind
  (:map pdf-view-mode-map
	("x" . 'pdf-two-page-prev)
	("c" . 'pdf-two-page-next)
	("v" . 'pdf-two-pages))

  :config
  (use-package pdf-virtual))

(use-package openwith :ensure t
  :config
  ;; (openwith-mode)
  )

(use-package elixir-mode :ensure t
  :init
  (use-package ruby-end :ensure t)
  (use-package alchemist :ensure t)
  :config
  (company-mode)
  (electric-pair-mode)
  (add-hook 'alchemist-iex-mode-hook 'company-mode)
  (add-hook 'alchemist-mode-hook 'ruby-end-mode)
  (add-hook 'alchemist-mode-hook 'company-mode)
  (add-hook 'alchemist-mode-hook
	    (lambda ()
	      (add-hook 'before-save-hook 'elixir-format nil t))))

(use-package erlang :ensure t
  :bind (:map erlang-mode-map
	      ("C-M-i" . 'company-erlang))
  :init
  (use-package company-erlang)
  :config
  (company-mode)
  (add-hook 'erlang-mode-hook
	    (lambda ()
	      (define-key erlang-mode-map (kbd "M-,") 'alchemist-goto-jump-back))))

;; (add-to-list 'tramp-default-proxies-alist
;;              '("\\.tenforward\\.local\\'" "\\`root\\'" "/ssh:%h:"))

(defun insert-euro ()
  (interactive)
  (insert "€"))
(global-set-key (kbd "C-c e") 'insert-euro)

(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))

(use-package slime :ensure t
  :bind (:map slime-mode-map
  	      ("C-M-i" . 'slime-fuzzy-complete-symbol))
  :config
  (setq slime-contribs '(slime-fancy slime-repl slime-scratch slime-trace-dialog)
	inferior-lisp-program "sbcl")
  (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
  (add-hook 'slime-repl-mode-hook 'paredit-mode))

(use-package geiser :ensure t
  :config
  (add-hook 'geiser-mode-hook
	    (lambda ()
	      (paredit-mode))))


(use-package go-mode :ensure t
  :bind (:map go-mode-map
	      ("C-M-i" . 'company-go))
  :init
  (use-package company :ensure t)
  (use-package company-go :ensure t)
  :config
  (setq company-tooltip-limit 20
	company-idle-delay .3
	company-echo-delay 0
	company-begin-commands '(self-insert-command))
  (add-hook 'go-mode-hook
	    (lambda ()
	      (set (make-local-variable 'company-backends) '(company-go))
	      (company-mode)
	      (go-eldoc-setup))
	    (set (make-local-variable 'before-save-hook) #'gofmt)))

(use-package popwin :ensure t
  :config
  (popwin-mode 1)
  (global-set-key (kbd "C-z") popwin:keymap))

