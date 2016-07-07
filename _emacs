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

(display-time)
(menu-bar-mode -1)
(tool-bar-mode -1)


(global-set-key (kbd "C-c ;") 'set-mark-command)
(global-set-key (kbd "C-c c") 'compile)


(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (toggle-scroll-bar -1))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

(setq diff-switches "-u") ;; default to unified diffs

(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (global-font-lock-mode t))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;;(setq require-final-newline 'query)

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (defvar cscope-program "/usr/local/bin/cscope" ))

;;; flycheck

(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (add-hook 'after-init-hook #'global-flycheck-mode))

(ignore-errors
  (add-hook 'after-init-hook #'global-company-mode))

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))


;; enable company mode for autocompletion
(add-hook
 'go-mode-hook
 (lambda ()
   (set (make-local-variable 'company-backends) '(company-go))
   (company-mode)))

(add-hook 'go-mode-hook 'flycheck-mode)

;; (add-hook
;;  'go-mode-hook
;;  '(lambda()
;;     (flycheck-mode)))

;; (add-hook
;;  'js2-mode-hook
;;  '(lambda()
;;     (flycheck-mode)))

;;; testing. not working as expected yet.
(add-hook
 'ess-mode-hook
 '(lambda()
    (when t
      (let ((cust-alist ess-r-customize-alist))
	(setcdr (assoc 'inferior-ess-primary-prompt cust-alist)
		"In \\[[0-9]+\\]: ")
	(setcdr (assoc 'inferior-ess-secondary-prompt cust-alist)
		"\\.\\.\\.\\.: ")
	nil))))

;;; enable god-mode, if exists
(ignore-errors ;;;(with-demoted-errors "Error: %S"
  
  (require 'god-mode)

  ;; NOTE: not working for tty
  ;; will override <esc> <esc> <esc> 'keyboard-escape-quit
  (global-set-key (kbd "<escape>") 'god-local-mode)
  ;;(global-set-key (kbd "<escape>") 'god-mode-all)

  ;;;; NOTE: C-c C-c 'comment-region
  ;;(global-set-key (kbd "C-c C-c") 'god-local-mode)

  ;; NOTE: override C-] 'abort-recursive-edit to do 'god-localmode
  ;;       at the same time
  (global-set-key (kbd "C-]")
		  (lambda()
		    (interactive)
		    (unwind-protect
			(abort-recursive-edit)
		      (god-local-mode))))
  
  (global-set-key (kbd "C-x C-1") 'delete-other-windows)
  (global-set-key (kbd "C-x C-2") 'split-window-below)
  (global-set-key (kbd "C-x C-3") 'split-window-right)
  (global-set-key (kbd "C-x C-0") 'delete-window)
  
  (define-key god-local-mode-map (kbd "z") 'repeat)
  (define-key god-local-mode-map (kbd "i") 'god-local-mode)
  (define-key god-local-mode-map (kbd ".") 'repeat)

  (defun c/god-mode-update-cursor ()
    (let ((limited-colors-p (> 257 (length (defined-colors)))))
      (if god-local-mode 
	  (progn
	    (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
	    (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
      (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
      (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832"))))



  (defun my-update-cursor ()
    (setq cursor-type (if (or god-local-mode buffer-read-only)
			  'box
			'bar)))

  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
  (add-hook 'god-mode-disabled-hook 'my-update-cursor)

  
  (defun god-toggle-on-overwrite ()
    "Toggle god-mode on overwrite-mode."
    (if (bound-and-true-p overwrite-mode)
	(god-local-mode-pause)
      (god-local-mode-resume)))

  (add-hook 'overwrite-mode-hook 'god-toggle-on-overwrite)



  (require 'god-mode-isearch)
  (define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
  (define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)



  (define-key god-local-mode-map [remap self-insert-command] 'my-god-mode-self-insert)

  (defun my-god-mode-self-insert ()
    (interactive)
    (if (and (bolp)
	     (eq major-mode 'org-mode))
	(call-interactively 'org-self-insert-command)
      (call-interactively 'god-mode-self-insert)))


  (add-to-list 'god-exempt-major-modes 'dired-mode)
  
  
  nil)


;;;
(ignore-errors ;;;(with-demoted-errors "Error: %S"
  (require 'compile)
  (add-hook
   'c-mode-hook
   (lambda ()
     (unless (file-exists-p "Makefile")
       (let* ((file (file-name-nondirectory buffer-file-name))
	      (out (file-name-sans-extension file))
	      (exe (file-name-sans-extension buffer-file-name))
	      (cc (or (getenv "CC") "gcc"))
	      (cppflags (or (getenv "CPPFLAGS") "-DDEBUG=9"))
	      (cflags (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g")))
	 (set (make-local-variable 'compile-command)
	      ;; emulate: $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
	      (format "%s -o %s %s %s %s && exec %s" ;;"%s -c -o %s.o %s %s %s"
		      cc out cppflags cflags file exe))))))
  (add-hook
   'c++-mode-hook
   (lambda ()
     (unless (file-exists-p "Makefile")
       (let* ((file (file-name-nondirectory buffer-file-name))
	      (out (file-name-sans-extension file))
	      (exe (file-name-sans-extension buffer-file-name))
	      (cxx (or (getenv "CXX") "g++"))
	      (cppflags (or (getenv "CPPFLAGS") "-DDEBUG=9"))
	      (cxxflags (or (getenv "CXXFLAGS") "-std=c++11 -pedantic -Wall -g")))
	 (set (make-local-variable 'compile-command)
	      (format "%s -o %s %s %s %s && exec %s" ;;"%s -c -o %s.o %s %s %s"
		      cxx out cppflags cxxflags file exe))))))
  (add-hook
   'go-mode-hook
   (lambda ()
     ;;(unless (file-exists-p "Makefile")
     (let* ((file (file-name-nondirectory buffer-file-name)))
       (set (make-local-variable 'compile-command)
	    (format "go run %s" file)))
     ;;)
     )) )

;;; user specific sub init scripts

(let ((list (directory-files "~/.local/etc/profile.d/" t ".*\.el$")))
  (while list
    (message (format "loading %s" (car list)))
    (ignore-errors ;;;    (with-demoted-errors "Error: %S"
      (load-library (car list)))
    (setq list (cdr list))))


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
