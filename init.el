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
 '(blink-matching-paren t)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (light-blue)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(erc-fill-column 90)
 '(erc-modules
   (quote
    (completion spelling hl-nicks netsplit fill button match track readonly networks ring autojoin noncommands irccontrols move-to-prompt stamp menu list)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (smart-mode-line system-packages ledger-mode magit which-key erc-hl-nicks paredit-mode paredit use-package exwm "exwm")))
 '(show-paren-mode t)
 '(sml/theme (quote respectful))
 '(text-scale-mode-step 1.1)
 '(tool-bar-mode nil))

;;; Faces set thru customize
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "LightBlue" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "mlss" :family "Anonymous Pro"))))
 '(erc-timestamp-face ((t (:foreground "magenta4" :weight bold))))
 '(mode-line ((t (:background "PaleGoldenrod" :foreground "black" :inverse-video nil :box (:line-width -1 :style released-button) :height 1.0))))
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
;; (package-install 'exwm)

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
	 ("C-c ;" . org-clock-out)))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (sml/setup))
