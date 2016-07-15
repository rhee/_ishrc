;; .emacs
;;; Code:

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(package-initialize)
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))

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

;; always end a file with a newline
;;(setq require-final-newline 'query)

(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (defvar cscope-program "/usr/local/bin/cscope" ))

;;; add all site-lisp subdirectory to load-path
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;;; user specific sub init scripts
(let ((list (directory-files "~/.local/etc/profile.d/" t ".*\.el$")))
  (while list
    (message (format "loading %s" (car list)))
    (with-demoted-errors "Error: %S"
      (load-library (car list)))
    (setq list (cdr list))))

;;; auto-generated codes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (js2-mode php-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
