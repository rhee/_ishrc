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


;;;;;;;;;;;;;

(global-set-key (kbd "C-c ;") 'set-mark-command)
(global-set-key (kbd "C-c c") 'compile)

(display-time)
(menu-bar-mode -1)
(tool-bar-mode -1)

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
    (ignore-errors ;;;    (with-demoted-errors "Error: %S"
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
