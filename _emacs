;; .emacs
;;; Code:

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; wrap for emacs-22
(unless (fboundp 'ignore-errors)
  (defmacro ignore-errors (&rest body)
    `(condition-case
       nil
       ,body
       (error nil)))
  (defmacro with-demoted-errors (message &rest body)
    `(condition-case
       err
       ,body
       (error (message ,message err))))
  nil)

(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (progn
    (package-initialize)
    (setq package-archives
	  '(("marmalade" . "http://marmalade-repo.org/packages/")
	    ("gnu" . "http://elpa.gnu.org/packages/")
	    ("melpa" . "http://melpa.milkbox.net/packages/")))
  nil)
    (error nil))

;; https://www.emacswiki.org/emacs/InstallingPackages
;;
;; You may want to start by installing the paradox package. This will
;; allow you to use the command paradox-list-packages, which among other
;; things gives the ability to sort package list by GitHub
;; popularity. Starting with the most popular packages is a good way to
;; find the most useful and effective ones.

;; If you move to a different system and you would like to quickly
;; install all of your previously installed packages, look into ‘M-x
;; package-install-selected-packages’. If you use UsePackage, the :ensure
;; t property will tell Emacs to install a package if it hasn’t already
;; been installed.


;;;;;;;;;;;;;

(global-set-key (kbd "C-c ;") 'set-mark-command)
(global-set-key (kbd "C-c c") 'compile)

(display-time)
(menu-bar-mode -1)

(ignore-errors
  (tool-bar-mode -1))

(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (toggle-scroll-bar -1))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; global font lock mode
(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (global-font-lock-mode t))

;; default to unified diffs
(setq diff-switches "-u")

;; extend regex to handle password prompt for github

;; Not a good idea. default comint-password-prompt-regexp
;; is complex enough, and I cannot recomment to replace it
;; with simple one line this.
;; Let's use git-credential-store --file ~/.git-credentials <cmd> ...
;; (setq comint-password-prompt-regexp
;;       (concat comint-password-prompt-regexp
;; 	      "\\|^Enter passphrase for .*:\\s *\\'"))

;; always end a file with a newline
;;(setq require-final-newline 'query)

(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (defvar cscope-program "/usr/local/bin/cscope" ))


;; ;; python-mode with ipython
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; add all site-lisp subdirectory to load-path
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;;; user specific sub init scripts
(with-demoted-errors
  "Error: %S"
  (let ((list
	 (directory-files "~/.local/etc/profile.d/" t ".*\.el$")))
    (while list
      (message (format "loading %s" (car list)))
      (with-demoted-errors "Error: %S"
			   (load-library (car list)))
      (setq list (cdr list)))))

(with-demoted-errors
    "Error: %S"
  (let ()
    ;;; prerequisits: M-x package-install fsm
    (add-to-list 'load-path "~/.emacs.d/user/pulseaudio")
    (require 'pulseaudio-autoload)))

(with-demoted-errors
    ""
  (let ((face-height-selection 5)
	(face-height-list '(100 110 120 130 140 160 180 200 240 300 360)))
    (defun mac-set-font-size (sel)
      ""
      (interactive)
      (set-face-attribute 'default nil :height (aref face-height-list face-height-selection))
      (setq face-height-selection sel))))





(custom-set-variables '(linum-format (quote "%5d ")))
;;(custom-set-variables '(linum-format 'dynamic))

(add-hook 'c-mode-common-hook 'linum-mode)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'js-mode-hook 'linum-mode)
(add-hook 'sh-mode-hook 'linum-mode)    ;https://stackoverflow.com/q/8892813






;;; auto-generated codes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil js2-mode php-mode))))
(set-face-attribute 'default nil :height 240)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "#ffffff"))))
 '(company-scrollbar-fg ((t (:background "#ffffff"))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(term-color-green ((t (:background "green" :foreground "green")))))
