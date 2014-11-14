;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rebind some keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; naughty one: C-/ should do undo..
(global-set-key [?\C-/] 'hippie-expand)

;; cursor movement stuff
(global-set-key [begin] 'recenter)
(global-set-key [home] 'beginning-of-line)
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-line)
(global-set-key [C-end] 'end-of-buffer)
(global-set-key [C-kp-end] 'end-of-buffer)
(global-set-key [M-up] 'backward-list)
(global-set-key [M-down] 'forward-list)

;; make sure common key-pad keys with modifiers map to something sensible
(global-set-key [C-kp-home] [C-home])
(global-set-key [C-kp-end] [C-end])
(global-set-key [C-kp-up] [C-up])
(global-set-key [M-kp-up] [M-up])
(global-set-key [C-kp-down] [C-down])
(global-set-key [M-kp-down] [M-down])
(global-set-key [C-kp-left] [C-left])
(global-set-key [M-kp-left] [M-left])
(global-set-key [C-kp-right] [C-right])
(global-set-key [M-kp-right] [M-right])

(global-set-key [C-kp-7] [C-home])
(global-set-key [C-kp-1] [C-end])
(global-set-key [C-kp-8] [C-up])
(global-set-key [M-kp-8] [M-up])
(global-set-key [C-kp-2] [C-down])
(global-set-key [M-kp-2] [M-down])
(global-set-key [C-kp-4] [C-left])
(global-set-key [M-kp-4] [M-left])
(global-set-key [C-kp-6] [C-right])
(global-set-key [M-kp-6] [M-right])

;; set up block editor key map
;;(setq block-editor-map (make-sparse-keymap))
;;(global-set-key [f2] block-editor-map)
(global-unset-key [f2])
(global-set-key [f2 ?g] 'grep)
(global-set-key [f2 ?f] 'string-rectangle)
(global-set-key [f2 ?k] 'kill-rectangle)
(global-set-key [f2 ?y] 'yank-rectangle)
(global-set-key [f2 ?c] 'copy-rectangle)
(global-set-key [f2 ?o] 'open-rectangle)
(global-set-key [f2 ?m] 'manual-entry)
(global-set-key [f2 ?i] 'indented-text-mode)
(global-set-key [f2 ?a] 'auto-fill-mode)
(global-set-key [f2 ?n] 'my-reverse)

;; function keys
(global-set-key [f1] 'compile)
(global-set-key [C-f1] 'next-error)
(global-set-key [f3] 'save-buffer)
(global-set-key [M-f3] 'ps-print-buffer-with-faces)
(global-set-key [f4] 'other-window)
(global-set-key [f5] 'switch-to-buffer)
(global-set-key [C-f4] 'repeat-complex-command)
(global-set-key [C-f5] 'call-last-kbd-macro)
(global-set-key [f6] 'find-file)
(global-set-key [C-f6] 'find-file-other-window)
(global-set-key [f7] 'calendar)
(global-set-key [f8] 'list-buffers)
(global-set-key [f9] 'undo)
(global-set-key "\C-z" 'undo)
(global-set-key [delete] 'delete-char)
;; mouse stuff

(global-set-key [vertical-scroll-bar mouse-3] 'ignore)
(global-set-key [vertical-scroll-bar down-mouse-2] 'ignore)
(global-set-key [vertical-scroll-bar mouse-2] 'scroll-bar-scroll-down)
(global-set-key [vertical-scroll-bar drag-mouse-2] 'scroll-bar-scroll-down)
(global-set-key [vertical-scroll-bar down-mouse-3] 'scroll-bar-drag)

(require 'mouse-copy)
(global-unset-key [C-down-mouse-2])
(global-set-key [C-mouse-1] 'mouse-start-secondary)
(global-set-key [C-mouse-2] 'mouse-yank-secondary)
(global-set-key [C-mouse-3] 'mouse-secondary-save-then-kill)
(global-set-key [C-down-mouse-1] 'mouse-drag-secondary-pasting)
(global-set-key [M-C-down-mouse-1] 'mouse-drag-secondary-moving)

(require 'mouse-drag)
(global-set-key [S-down-mouse-2] 'mouse-drag-throw)
(global-set-key [down-mouse-2] 'mouse-drag-drag)
;; ;;(setq mouse-throw-with-scroll-bar t)

;; magic wheel mouse stuff
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)


(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

(global-set-key [f11] 'xhg-status)
(global-set-key [C-f11] 'svn-status)

;; windows is killing me
(global-set-key "\C-v" 'yank)

;; make text-mode more interesting
(add-hook 'text-mode-hook
	  (function (lambda ()
		      (auto-fill-mode t))))

;; c-mode fixes
(add-hook 'c-mode-hook
	  (function (lambda ()
		      (setq c-electric-pound-behavior '(alignleft))
		      (local-set-key "\C-m" 'newline-and-indent))))
(add-hook 'c++-mode-hook
	  (function (lambda ()
		      (local-set-key "\C-m" 'newline-and-indent))))


;; org mode
(add-hook 'org-mode-hook
	  (function (lambda ()
		      (local-set-key "\C-ca" 'org-agenda))))

;; tex/latex mode stuff
(setq tex-dvi-view-command "xdvi")


;; python mode
(require 'python-mode)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tac$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))
(autoload 'python-mode "python" "Python editing mode." t)


(require 'tramp)
(require 'python-pep8)

(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key "\C-m" 'newline-and-indent)))

(add-hook 'python-mode-hook
          #'(lambda ()
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action))))

;; desktop stuff
(setq safe-local-variable-values (quote ((py-indent-offset . 4))))
(load "desktop")

;; don't save .log, ftp, tags or RMAIL files (RMAIL seems to lock things up
;; when it reloads)
(setq desktop-buffers-not-to-save
 "\\(^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS\\|^RMAIL.*\\)$")


(add-hook 'kill-emacs-hook
	  '(lambda ()
	     (desktop-truncate search-ring 3)
	     (desktop-truncate regexp-search-ring 3)))

(display-time)

;; set up so we can use emacsclient
(server-start)

;; turn on iswitchb-mode
(iswitchb-mode)

