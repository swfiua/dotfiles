;;(load "hilit19")
;;(setq debug-on-error t)
(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(setq debug-on-error nil)

;; add my stuff to the load-path
;;(setq load-path (append (list "~jng/emacs") load-path))

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

;; add cheetah documentation to info list
;;(add-to-list 'Info-default-directory-list "~jng/SOURCE/DEVELOP/flasher/doc/")

;;(autoload 'svk-status "psvk" nil t)
;;(require 'vc-svk)

;; restructured text mode

(require 'rst)
(require 'twittering-mode)
;; (add-hook 'text-mode-hook 'rst-text-mode-bindings)

;; require my datalog mode
;;(require 'datalog)
;;(add-hook 'datalog-mode-hook
;;	  (function (lambda ()
;;		      (local-set-key "\C-m" 'newline-and-indent))))


;; for gtk-snapshot with font goodness
;;(set-default-font "Bitstream Vera Sans Mono-7")
;;(set-default-font "Bitstream Vera Sans Mono-9")
;;(set-default-font "Bitstream Vera Sans Mono-11")
(setq default-frame-alist '(
			    ;; (font . "Bitstream Vera Sans Mono-9") 
			    (scroll-bar-mode . right)))


;;(set-default-font "Bitstream Vera Sans Mono-15")
;;(set-default-font "Bitstream Vera Sans Mono")
;;(set-default-font "Bitstream Vera Sans Mono-9")

;;(set-default-font "-bitstream-bitstream vera sans mono-regular-roman-normal--10-*-*-*-*-*-fontset-startup")
;;(set-default-font "-bitstream-bitstream vera sans mono-regular-roman-normal--11-*-*-*-*-*-fontset-startup")
;;(set-default-font "-bitstream-bitstream vera sans mono-regular-roman-normal--12-*-*-*-*-*-fontset-startup")

;;(set-default-font "-bitstream-bitstream vera sans mono")

;; font-lock mode stuff
(global-font-lock-mode t)
(setq font-lock-maximum-decoration
      '((c-mode . 3) (c++-mode . 3) (tex-mode . 3) (latex-mode . 3)
	(java-mode . 3)))

;; set up some colours
;;(set-face-foreground 'highlight "black")
;;(set-face-background 'highlight "gold")
;;(make-face-bold 'highlight)
;;(set-face-background 'region "#228822")
;;(make-face-bold 'region)
;;(set-face-background 'secondary-selection "#222277")
;;(make-face-bold 'secondary-selection)

;; fix back-ups to copy if links are involved
(setq backup-by-copying-when-linked t)

;; make makefile mode electric
(setq makefile-electric-keys t)

;; require final newline when file is saved
(setq require-final-newline t)

;; fancy mini-buffer completeion and hippie-exp
;;(load "complete")

;; pyflakes stuff via flymake
(when (load "flymake" t) 
         (defun flymake-pyflakes-init () 
           (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                              'flymake-create-temp-inplace)) 
              (local-file (file-relative-name 
                           temp-file 
                           (file-name-directory buffer-file-name)))) 
             (list "pyflakes" (list local-file)))) 

         (add-to-list 'flymake-allowed-file-name-masks 
                  '("\\.py\\'" flymake-pyflakes-init)
                  '("\\.pyx\\'" flymake-pyflakes-init))) 

;;(add-hook 'find-file-hook 'flymake-find-file-hook)


;; doctest mode magic
;;(autoload 'doctest-register-mmm-classes "doctest-mode")
;;(doctest-register-mmm-classes t t)

;; csharp-mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
   (setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;; visual-basic-mode
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" .
				 visual-basic-mode)) auto-mode-alist))


;; other goodness
(require 'hippie-exp)
;;(require 'yasnippet)      
;;(yas/initialize)
;;(yas/load-directory "~/emacs/yasnippet/snippets")

;; pending-delete mode 
(require 'delsel)
(transient-mark-mode t)
(setq highlight-nonselected-windows nil)


;;(load-library "pylint")

;; miscellaneous goodies
(defun mycompile(command)
  (interactive
   (if (or compilation-read-command current-prefix-arg)
       (list (read-from-minibuffer "Compile command: "
                                 compile-command nil nil
                                 '(compile-history . 1)))
     (list compile-command)))
  (setq compile-command command)
  (switch-to-buffer "Makefile")
  (save-some-buffers (not compilation-ask-about-save) nil)
  (compile-internal compile-command "No more errors"))

(defun my-reverse(&optional arg)
  (interactive "P")
  (x-handle-reverse-video (selected-frame) '((reverse . t))))

(my-reverse)

;; load part 2 of initialisation
(load "~/.emacs.d/part2.el")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["white" "red" "green" "yellow" "white" "magenta" "cyan" "black"])
 '(blink-cursor-mode nil)
 '(browse-url-firefox-startup-arguments (quote ("")))
 '(case-fold-search t)
 '(clean-buffer-list-delay-general 4)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(delete-selection-mode t nil (delsel))
 '(desktop-save-mode t)
 '(dired-recursive-deletes t)
 '(display-time-mode t)
 '(flymake-allowed-file-name-masks (quote (("\\.py\\'" flymake-pyflakes-init) ("\\.xml\\'" flymake-xml-init) ("\\.html?\\'" flymake-xml-init) ("\\.cs\\'" flymake-simple-make-init) ("\\.p[ml]\\'" flymake-perl-init) ("\\.php[345]?\\'" flymake-php-init) ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) ("\\.idl\\'" flymake-simple-make-init))))
 '(global-font-lock-mode t nil (font-lock))
 '(jabber-connection-type (quote ssl))
 '(jabber-network-server "localhost")
 '(jabber-server "gmail.com")
 '(jabber-username "swfiua")
 '(latex-run-command "pdflatex")
 '(lpr-page-header-switches (quote ("-l 66")))
 '(midnight-mode t nil (midnight))
 '(msb-mode t nil (msb))
 '(org-agenda-files (quote ("~/personal/hols.org" "~/todo.org")))
 '(py-indent-offset 4)
 '(scroll-bar-mode (quote right))
 '(speedbar-activity-change-focus-flag t)
 '(speedbar-track-mouse-flag nil)
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode nil nil (tooltip))
 '(vc-handled-backends (quote (Bzr RCS CVS SVN SCCS Git Hg Mtn Arch))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(rst-level-1-face ((t (:background "grey40"))) t)
 '(rst-level-2-face ((t (:background "grey40"))) t))
