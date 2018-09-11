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
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(erc-fill-column 90)
 '(erc-modules
   (quote
    (completion notifications spelling hl-nicks netsplit fill button match track readonly networks ring autojoin noncommands irccontrols move-to-prompt stamp menu list)))
 '(erc-notifications-icon
   "/usr/share/icons/Adwaita/48x48/status/user-available-symbolic.symbolic.png")
 '(inferior-lisp-program "sbcl" t)
 '(menu-bar-mode nil)
 '(mu4e-maildir "/home/jacob/Maildir/Gmail")
 '(openwith-associations
   (quote
    (("\\.pdf\\'" "mupdf"
      (file))
     ("\\.mp3\\'" "xmms"
      (file))
     ("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer"
      ("-idx" file))
     ("\\.\\(?:jp?g\\|png\\)\\'" "display"
      (file)))))
 '(org-agenda-files (quote ("~/org/gcal.org" "~/org/root.org")))
 '(org-archive-location ".archive.org::")
 '(org-capture-templates
   (quote
    (("g" "gcal" entry
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
      "* Lambda Calculus :uvalc:" :prepend t :clock-in t :clock-keep t))))
 '(org-datetree-add-timestamp (quote inactive))
 '(org-default-notes-file "~/org/notes.org")
 '(org-indent-indentation-per-level 1)
 '(org-pretty-entities t)
 '(package-selected-packages
   (quote
    (djvu geiser racket-mode slime-company slime ruby-end ob-lfe lfe-mode company-inf-ruby enh-ruby-mode erlang alchemist elixir-mode openwith org-pdfview pdf-tools org-gcal bongo dired-rsync rainbow-mode easy-hugo org ace-window magithub request csv-mode elpy use-package-ensure-system-package pulseaudio-control solarized-theme smart-mode-line system-packages ledger-mode magit which-key erc-hl-nicks paredit-mode paredit use-package exwm "exwm")))
 '(pulseaudio-control-volume-step "5%")
 '(show-paren-mode t)
 '(solarized-height-minus-1 1.0)
 '(solarized-height-plus-1 1.0)
 '(solarized-height-plus-2 1.0)
 '(solarized-height-plus-3 1.0)
 '(solarized-height-plus-4 1.0)
 '(solarized-high-contrast-mode-line nil)
 '(solarized-scale-org-headlines nil)
 '(solarized-use-variable-pitch nil)
 '(text-scale-mode-step 1.1)
 '(tool-bar-mode nil))

;;; Faces set thru customize
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "mlss" :family "Anonymous Pro"))))
 '(show-paren-match ((t (:background "steel blue")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Package Configuration

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ;; ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/"))
      use-package-verbose t
      use-package-always-ensure nil)


(package-initialize)
(package-install 'use-package)
;; (use-package use-package-ensure-system-package
;;   :ensure t)
;; (package-install 'exwm)

;;; The All-Important Theme
(load-theme 'solarized-dark)


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


(defun latex-key-binds ()
  (local-set-key (kbd "s-=") (lambda () (interactive) (insert "\\approx{}")))

  (local-set-key (kbd "s-a") (lambda () (interactive) (insert "\\alpha{}")))
  (local-set-key (kbd "M-s-a") (lambda () (interactive) (insert "\\Alpha{}")))
  (local-set-key (kbd "s-b") (lambda () (interactive) (insert "\\beta{}")))
  (local-set-key (kbd "M-s-b") (lambda () (interactive) (insert "\\Beta{}")))
  (local-set-key (kbd "s-g") (lambda () (interactive) (insert "\\gamma{}")))
  (local-set-key (kbd "M-s-g") (lambda () (interactive) (insert "\\Gamma{}")))
  (local-set-key (kbd "s-d") (lambda () (interactive) (insert "\\delta{}")))
  (local-set-key (kbd "M-s-d") (lambda () (interactive) (insert "\\Delta{}")))

  (local-set-key (kbd "s-e") (lambda () (interactive) (insert "\\epsilon{}")))
  (local-set-key (kbd "M-s-e") (lambda () (interactive) (insert "\\Epsilon{}")))
  (local-set-key (kbd "s-e") (lambda () (interactive) (insert "\\eta{}")))
  (local-set-key (kbd "M-s-e") (lambda () (interactive) (insert "\\Eta{}")))

  (local-set-key (kbd "s-z") (lambda () (interactive) (insert "\\zeta{}")))
  (local-set-key (kbd "M-s-z") (lambda () (interactive) (insert "\\Zeta{}")))

  (local-set-key (kbd "s-h") (lambda () (interactive) (insert "\\theta{}")))
  (local-set-key (kbd "M-s-h") (lambda () (interactive) (insert "\\Theta{}")))
  (local-set-key (kbd "s-v") (lambda () (interactive) (insert "\\vartheta{}")))

  (local-set-key (kbd "s-i") (lambda () (interactive) (insert "\\iota{}")))
  (local-set-key (kbd "M-s-i") (lambda () (interactive) (insert "\\Iota{}")))

  (local-set-key (kbd "s-k") (lambda () (interactive) (insert "\\kappa{}")))
  (local-set-key (kbd "M-s-k") (lambda () (interactive) (insert "\\Kappa{}")))

  (local-set-key (kbd "s-l") (lambda () (interactive) (insert "\\lambda{}")))
  (local-set-key (kbd "M-s-l") (lambda () (interactive) (insert "\\Lambda{}")))

  (local-set-key (kbd "s-m") (lambda () (interactive) (insert "\\mu{}")))
  (local-set-key (kbd "M-s-m") (lambda () (interactive) (insert "\\Mu{}")))

  (local-set-key (kbd "s-m") (lambda () (interactive) (insert "\\nu{}")))
  (local-set-key (kbd "M-s-m") (lambda () (interactive) (insert "\\Nu{}")))

  (local-set-key (kbd "s-x") (lambda () (interactive) (insert "\\xi{}")))
  (local-set-key (kbd "M-s-x") (lambda () (interactive) (insert "\\Xi{}")))

  (local-set-key (kbd "s-o") (lambda () (interactive) (insert "\\omicron{}")))
  (local-set-key (kbd "M-s-o") (lambda () (interactive) (insert "\\Omicron{}")))

  (local-set-key (kbd "s-p") (lambda () (interactive) (insert "\\pi{}")))
  (local-set-key (kbd "M-s-p") (lambda () (interactive) (insert "\\Pi{}")))

  (local-set-key (kbd "s-r") (lambda () (interactive) (insert "\\rho{}")))
  (local-set-key (kbd "M-s-r") (lambda () (interactive) (insert "\\Rho{}")))

  (local-set-key (kbd "s-s") (lambda () (interactive) (insert "\\sigma{}")))
  (local-set-key (kbd "M-s-s") (lambda () (interactive) (insert "\\Sigma{}")))

  (local-set-key (kbd "s-t") (lambda () (interactive) (insert "\\tau{}")))
  (local-set-key (kbd "M-s-t") (lambda () (interactive) (insert "\\Tau{}")))

  (local-set-key (kbd "s-f") (lambda () (interactive) (insert "\\phi{}")))
  (local-set-key (kbd "M-s-f") (lambda () (interactive) (insert "\\Phi{}")))

  (local-set-key (kbd "s-.") (lambda () (interactive) (insert "\\cdot{}")))

  (local-set-key (kbd "s-|") (lambda () (interactive) (insert "\\parallel{}")))
  (local-set-key (kbd "M-s-|") (lambda () (interactive) (insert "_\\parallel{}_")))
  (local-set-key (kbd "s-r") (lambda () (interactive) (insert "\\rho{}")))
  (local-set-key (kbd "M-s-r") (lambda () (interactive) (insert "\\Rho{}"))))


(use-package org
  :ensure t
  ;; install texlive-latex-extra
  :bind (("C-c a" . org-agenda)
	 ("C-c l" . org-store-link)
	 ("C-c c" . org-capture)
	 ("C-c j" . org-clock-goto)
	 ("C-c ;" . org-clock-out)
	 ;; ("s-l" . (lambda (interactive) (insert "\lambda")))
	 ;; ("M-s-l" . (lambda (interactive) (insert "\Lambda")))
	 )
  :init
  (add-hook 'org-mode-hook
	    (lambda ()
	      (flyspell-mode)
	      (auto-fill-mode)
	      (latex-key-binds)))
  (use-package org-gcal :ensure t
    ;; Client ID: 57356994780-b16iviqe25vsamd1iec7n51of8skfkbr.apps.googleusercontent.com
    :config
    (setq org-gcal-client-id "542204698176-hca6etaeqjnugs3bkn1pvo39gafjm3ri.apps.googleusercontent.com"
	  org-gcal-client-secret "7UlSyhCz7FmT3hXrByhjIMch"
	  org-gcal-file-alist '(("jacobsonnenberg0@gmail.com" . "~/org/gcal.org")))
    (add-hook 'org-agenda-mode-hook 'org-gcal-sync)
    (add-hook 'org-capture-after-finalize-hook 'org-gcal-sync))
  (use-package org-pdfview :ensure t
    :config
    (add-to-list 'org-file-apps
		 '("\\.pdf\\'" . (lambda (file link)
				   (org-pdfview-open link))))))

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
  (pdf-tools-install))

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
  (add-hook 'alchemist-iex-mode-hook 'company-mode)
  (add-hook 'alchemist-mode-hook 'ruby-end-mode)
  (add-hook 'alchemist-mode-hook 'company-mode)
  (add-hook 'alchemist-mode-hook
	    (lambda ()
	      (add-hook 'before-save-hook 'elixir-format nil t))))

(use-package erlang :ensure t
  :config
  (add-hook 'erlang-mode-hook
	    (lambda ()
	      (define-key erlang-mode-map (kbd "M-,") 'alchemist-goto-jump-back))))

;; (add-to-list 'tramp-default-proxies-alist
;;              '("\\.tenforward\\.local\\'" "\\`root\\'" "/ssh:%h:"))

(defun insert-euro ()
  (interactive)
  (insert "€"))
(global-set-key (kbd "C-c e") 'insert-euro)

(use-package slime :ensure t
  :config
  (setq slime-contribs '(slime-fancy)
	inferior-lisp-program "sbcl")
  (defun override-slime-repl-bindings-with-paredit ()
    (define-key slime-repl-mode-map
      (read-kbd-macro paredit-backward-delete-key)
      nil))
  (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit
	    )
  (add-hook 'slime-repl-mode-hook 'paredit-mode))
