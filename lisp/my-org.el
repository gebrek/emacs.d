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

