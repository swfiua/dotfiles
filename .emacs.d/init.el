;;(setq debug-on-error t)
;;(setq debug-on-error nil)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

;; restructured text mode

(require 'rst)
(require 'twittering-mode)
(require 'multiple-cursors)

(setq default-frame-alist '(
			    ;; (font . "Bitstream Vera Sans Mono-9") 
			    (scroll-bar-mode . right)))


;; font-lock mode stuff
(global-font-lock-mode t)
(setq font-lock-maximum-decoration
      '((c-mode . 3) (c++-mode . 3) (tex-mode . 3) (latex-mode . 3)
	(java-mode . 3)))

;; fix back-ups to copy if links are involved
(setq backup-by-copying-when-linked t)

;; require final newline when file is saved
(setq require-final-newline t)

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

;; csharp-mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
   (setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;; other goodness
(require 'hippie-exp)

;; pending-delete mode 
(require 'delsel)
(transient-mark-mode t)
(setq highlight-nonselected-windows nil)


(defun my-reverse(&optional arg)
  (interactive "P")
  (x-handle-reverse-video (selected-frame) '((reverse . t))))

(my-reverse)

;; load part 2 of initialisation
(load "~/.emacs.d/part2.el")

;; bbdb init
;; (load "~/.emacs.d/bbdbinit.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["white" "red" "green" "yellow" "white" "magenta" "cyan" "black"])
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote browse-url-xdg-open))
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
 '(mm-text-html-renderer (quote w3m))
 '(msb-mode t nil (msb))
 '(org-agenda-files (quote ("~/personal/hols.org" "~/todo.org" "~/Devel/TODO/travel.org")))
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
