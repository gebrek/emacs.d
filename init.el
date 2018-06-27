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
 '(menu-bar-mode nil)
 '(mu4e-maildir "/home/jacob/Maildir/Gmail")
 '(org-agenda-files (quote ("~/org/root.org")))
 '(org-archive-location ".archive.org::")
 '(org-capture-templates
   (quote
    (("t" "todo" entry
      (file+headline "~/org/root.org" "Todo")
      "** TODO %? %^G
")
     ("n" "note" entry
      (file+headline "~/org/root.org" "Notes")
      "** %?
   - Note taken on %U
   - %a
"))))
 '(org-datetree-add-timestamp (quote inactive))
 '(org-default-notes-file "~/org/notes.org")
 '(package-selected-packages
   (quote
    (rainbow-mode easy-hugo org ace-window magithub request csv-mode elpy use-package-ensure-system-package pulseaudio-control solarized-theme smart-mode-line system-packages ledger-mode magit which-key erc-hl-nicks paredit-mode paredit use-package exwm "exwm")))
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

(use-package org
  :ensure t
  :bind (("C-c a" . org-agenda)
	 ("C-c l" . org-store-link)
	 ("C-c c" . org-capture)
	 ("C-c j" . org-clock-goto)
	 ("C-c ;" . org-clock-out))
  :init
  (add-hook 'org-mode-hook
	    (lambda ()
	      (flyspell-mode)
	      (auto-fill-mode))))

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

(use-package mu4e
  :ensure-system-package html2text
  :config
  (setq mu4e-html2text-command "html2text -utf8 -width 72"))

(use-package elpy
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
  (interactive "p")
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
