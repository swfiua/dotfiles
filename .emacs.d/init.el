;;(setq debug-on-error t)

;; load part 1 of initialisation
(load "~/.emacs.d/part1.el")

;; bbdb init
(load "~/.emacs.d/bbdbinit.el")

;; load part 2 of initialisation
(load "~/.emacs.d/part2.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["white" "red" "green" "yellow" "white" "magenta" "cyan" "black"])
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote browse-url-w3))
 '(browse-url-firefox-startup-arguments (quote ("")))
 '(case-fold-search t)
 '(delete-selection-mode t nil (delsel))
 '(desktop-restore-frames nil)
 '(desktop-save-mode t)
 '(dired-recursive-deletes t)
 '(display-time-mode t)
 '(ein:complete-on-dot nil)
 '(elfeed-feeds
   (quote
    ("http://blog.raymond.burkholder.net/index.php?/feeds/index.rss2" "http://www.theguardian.com/uk/rss" "http://www.theguardian.com/uk/rss\"" "http://openbermuda.org/80days/rss.xml" "https://bermudaweather.wordpress.com/feed/")))
 '(flymake-allowed-file-name-masks
   (quote
    (("\\.py\\'" flymake-pyflakes-init)
     ("\\.xml\\'" flymake-xml-init)
     ("\\.html?\\'" flymake-xml-init)
     ("\\.cs\\'" flymake-simple-make-init)
     ("\\.p[ml]\\'" flymake-perl-init)
     ("\\.php[345]?\\'" flymake-php-init)
     ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup)
     ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
     ("\\.idl\\'" flymake-simple-make-init))))
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(latex-run-command "pdflatex")
 '(midnight-mode t nil (midnight))
 '(mm-text-html-renderer (quote w3m))
 '(org-agenda-files
   (quote
    ("~/personal/hols.org" "~/todo.org" "~/Devel/TODO/travel.org")))
 '(py-indent-offset 4)
 '(scroll-bar-mode (quote right))
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




