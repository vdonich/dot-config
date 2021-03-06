(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-interval 1)
 '(auto-save-file-name-transforms
   (quote
    ((".*" "~/bak" t)
     ("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/var/folders/00/0yt30000h01000cxqpysvccm003v8c/T/\\2" t))))
 '(backup-by-copying t)
 '(backup-by-copying-when-linked t)
 '(backup-directory-alist
   (quote
    (("gerrit" . "~/back/gerrit")
     (".*" . "~/back"))))
 '(bazel-format-command "buildifier")
 '(column-number-mode t)
 '(company-idle-delay nil)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(delete-selection-mode t)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(display-time-world-timer-enable nil)
 '(fill-column 80)
 '(flycheck-eslint-rules-directories nil)
 '(git-commit-fill-column 72)
 '(git-commit-style-convention-checks (quote (non-empty-second-line overlong-summary-line)))
 '(global-auto-revert-mode t)
 '(gnutls-trustfiles
   (quote
    ("/etc/ssl/certs/ca-certificates.crt" "/etc/pki/tls/certs/ca-bundle.crt" "/etc/ssl/ca-bundle.pem" "/usr/ssl/certs/ca-bundle.crt" "/usr/local/share/certs/ca-root-nss.crt" "/private/etc/ssl/cert.pem")))
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(ido-vertical-define-keys (quote C-n-C-p-up-down-left-right))
 '(ido-vertical-mode t)
 '(indent-tabs-mode nil)
 '(ispell-program-name "/usr/local/bin/aspell")
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-indent-switch-body t)
 '(js2-mode-assume-strict t)
 '(js2-pretty-multiline-declarations nil)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(js3-expr-indent-offset 2)
 '(js3-paren-indent-offset 2)
 '(menu-bar-mode nil)
 '(mweb-default-major-mode (quote nxml-mode))
 '(org-agenda-files (quote ("~/Documents/notes.txt")))
 '(org-default-notes-file "~/Documents/notes.txt")
 '(org-export-headline-levels 5)
 '(org-export-with-section-numbers nil)
 '(org-export-with-sub-superscripts (quote {}))
 '(org-export-with-title nil)
 '(org-export-with-toc nil)
 '(org-hide-leading-stars t)
 '(org-html-allow-name-attribute-in-anchors nil)
 '(org-html-creator-string "")
 '(org-html-head
   "<style type=\"text/css\">pre {font-family: Courier New;}</style>")
 '(org-html-head-include-default-style nil)
 '(org-html-head-include-scripts nil)
 '(org-html-home/up-format "")
 '(org-html-html5-fancy t)
 '(org-html-htmlize-output-type (quote inline-css))
 '(org-html-postamble nil)
 '(org-html-toplevel-hlevel 1)
 '(org-html-validation-link "")
 '(org-indent-mode-turns-on-hiding-stars t)
 '(org-latex-packages-alist (quote (("" "minted" t))))
 '(org-src-fontify-natively t)
 '(org-src-lang-modes
   (quote
    (("arduino" . arduino)
     ("redis" . redis)
     ("php" . php)
     ("C" . c)
     ("C++" . c++)
     ("asymptote" . asy)
     ("bash" . sh)
     ("beamer" . latex)
     ("calc" . fundamental)
     ("cpp" . c++)
     ("ditaa" . artist)
     ("dot" . fundamental)
     ("elisp" . emacs-lisp)
     ("ocaml" . tuareg)
     ("screen" . shell-script)
     ("shell" . sh)
     ("sqlite" . sql)
     ("plantuml" . plantuml))))
 '(org-startup-indented t)
 '(org-support-shift-select (quote always))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (plantuml-mode dart-mode rust-auto-use rust-mode rust-playground rustic add-node-modules-path protobuf-mode bazel-mode yaml-mode docker dockerfile-mode org-plus-contrib eslint-fix adoc-mode rainbow-delimiters exec-path-from-shell adaptive-wrap company htmlize web-mode visual-regexp-steroids smart-mode-line-powerline-theme ox-gfm ov narrow-indirect matlab-mode markdown-mode json-mode js3-mode js2-refactor js2-highlight-vars idomenu ido-vertical-mode haskell-mode graphviz-dot-mode go-mode git-commit gh-md fringe-helper flycheck fiplr find-file-in-repository diff-hl clang-format atomic-chrome)))
 '(plantuml-jar-path "")
 '(plantuml-java-command "plantuml")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(smerge-command-prefix "\\C-cv")
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-control-block-indentation t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 2)
 '(web-mode-style-padding 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "green2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "apple" :family "Consolas"))))
 '(diff-removed ((t (:inherit diff-changed :foreground "red"))))
 '(trailing-whitespace ((t (:underline (:color "red" :style wave)))))
 '(whitespace-line ((t (:background "red" :foreground "black" :underline (:color "red" :style wave))))))
