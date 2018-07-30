;; Builtins

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq backup-directory-alist `(("." . "~/.saves")))


;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; (setq exec-path (append exec-path '("/usr/local/bin")))
(setq gc-cons-threshold 100000000) ; ie 100mb, default is 800kb
(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(auto-save-default nil)
 '(column-number-mode 1)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("d9046dcd38624dbe0eb84605e77d165e24fdfca3a40c3b13f504728bab0bf99d" default)))
 '(fci-rule-color "#49483E")
 '(global-linum-mode 1)
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(inhibit-startup-screen t)
 '(linum-format "%d ")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (exec-path-from-shell jedi jedi-core nginx-mode yaml-mode virtualenvwrapper terraform-mode smex rw-hunspell rjsx-mode pyvirtualenv python-docstring pungi nose markdown-preview-mode jinja2-mode ipython ido-yes-or-no helm-ispell helm flymd flycheck-pyflakes ein-mumamo dockerfile-mode csharp-mode color-theme-sanityinc-solarized color-theme auto-package-update auctex-latexmk ac-ispell)))
 '(show-paren-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

;;******************** SMEX ********************
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;******************** ispell with hunspell ********************
;; Workaround for OSX + homebrew
;; (setenv "DICTIONARY" "en_GB")
;; (setenv "LANG" "en_GB")
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; (setq exec-path (append exec-path '("/usr/local/bin/")))
;; ;; Set default dict to hunspell
;; (setq-default ispell-program-name "hunspell")
;; ;; auto start flyspell
;; (flyspell-mode t)

;;******************** HELM ********************
;;(require 'helm)
;;(global-set-key (kbd "M-x") 'helm-M-x)


;;******************** Run TESTS ********************

(global-set-key (kbd "<f9>") 'recompile)


;;******************** Pane switch with shift+arrows ********************

;; use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings)
;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around t )


;; Tidy up

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; HideShow mode

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
         (1+ (current-column))))))

(load-library "hideshow")
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'c++-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
;; Hide the comments too when you do a 'hs-hide-all'
(setq hs-hide-comments nil)
;; Set whether isearch opens folded comments, code, or both
;; where x is code, comments, t (both), or nil (neither)
(setq hs-isearch-open 'x)


;;******************** Disable toolbars crap ********************
(menu-bar-mode -1)
(when (display-graphic-p)
  (tool-bar-mode -1))


;;******************** Package repos ********************
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

;; Auto update packages ()
;;(auto-package-update-mayevery 7 days)
;;(setq auto-package-update-delete-old-versions t)

;;******************** Themes *******************
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; Monokai
(load-theme 'monokai t)


;;******************** IDO ********************
(ido-mode t)


;;******************** Flycheck ********************
(add-hook 'after-init-hook #'global-flycheck-mode)

;;******************** Rebinds ********************
(global-set-key (kbd "C-f") 'goto-line) ; Ctrl+f


;;******************** PYTHON ********************

;; Virtualenv
;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "~/.virtualenvs")

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command) "nosetests")))
;; JEDI
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Force indend 4 spaces
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq-default indent-tabs-mode nil)
	    (setq-default tab-width 4)
	    (setq-default python-indent 4)
	    ))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
