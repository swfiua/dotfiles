;;(setq debug-on-error t)
;;(setq debug-on-error nil)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq package-list '(git-commit 
      lua-mode magit gh
      python-mode bbdb-ext bbdb bbdb-vcard bbdb
      bbdb2erc  ein-mumamo ein request websocket
      direx popup python-environment deferred epc ctable
      concurrent w3 w3m))

(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))
 
;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; load theme
(load-theme 'deeper-blue)

;; restructured text mode
(require 'rst)

;;(require 'twittering-mode)
;;(require 'multiple-cursors)
;;(set-face-attribute 'default nil :height 160)

(setq default-frame-alist '(
			    ;;(font . "Bitstream Vera Sans Mono-9") 
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

;;(if (display-graphic-p)
;;    (my-reverse))

(defun details()
  (interactive)
  (setq user-mail-address "john@details.bm"))

(defun swfiua()
  (interactive)
  (setq user-mail-address "swfiua@gmail.com"))
  
