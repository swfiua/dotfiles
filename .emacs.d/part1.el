;;(setq debug-on-error t)
;;(setq debug-on-error nil)


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

(defun swfiua()
  (interactive)
  (setq user-mail-address "swfiua@gmail.com"))
  
