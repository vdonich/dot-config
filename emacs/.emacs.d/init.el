;;; init.el

(setq-default custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

(package-install-selected-packages)

;; get $PATH from shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; some weird emacs behaviors
(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq bkup-dir "~/.emacs.d/bkup/") ;; no more temp files in the folder

(setq backup-directory-alist
      `((".*" . ,bkup-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,bkup-dir t)))

(setq-default indent-tabs-mode nil)

;; no tool bar
(tool-bar-mode -1)

;; visual-line-mode, adaptive-wrap-prefix-mode
;(global-visual-line-mode t)
;; osx distnoted in high sierra goes nuts if you mess with the visual-line-mode
;(add-hook 'minibuffer-setup-hook
;          (lambda ()
;            (visual-line-mode -1)))

(setq sml/theme 'dark)
(sml/setup)

(yas-global-mode)

(put 'narrow-to-region 'disabled nil)

(global-set-key (kbd "<f8>") 'erase-buffer)
(global-set-key [end] 'end-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key (kbd "C-x f") 'find-file-in-repository)
(global-set-key (kbd "C-<return>") 'dabbrev-expand)
(global-set-key (kbd "M-RET") 'dabbrev-expand)
(global-set-key (kbd "C-b") 'bury-buffer)
(global-set-key (kbd "s-[")  'backward-sexp)
(global-set-key (kbd "s-]")  'forward-sexp)
(global-set-key [f7] 'compile)
(global-set-key (kbd "C-<f7>") 'shell-command)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cr" 'rgrep)
(global-set-key "\C-cf" 'find-name-dired)
(global-set-key [f3] 'calculator)
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

(global-set-key [A-left] 'windmove-left)          ; move to left windnow
(global-set-key [A-right] 'windmove-right)        ; move to right window
(global-set-key [A-up] 'windmove-up)              ; move to upper window
(global-set-key [A-down] 'windmove-down)          ; move to downer window

(global-set-key "\C-ci" 'idomenu)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(require 'atomic-chrome)
(atomic-chrome-start-server)

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face trailing empty tab-mark))
(add-hook 'prog-mode-hook 'whitespace-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.bzl\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("BUILD" . bazel-mode))
(add-to-list 'auto-mode-alist '("\\.fidl\\'" . idl-mode))

(add-hook 'js2-mode-hook
          (defun my-js2-mode-setup ()
            (add-node-modules-path)
            (flycheck-mode t)
            (when (executable-find "eslint")
              (flycheck-select-checker 'javascript-eslint))))

(add-hook 'bazel-mode-hook (lambda () (add-hook 'before-save-hook #'bazel-format nil t)))

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(setenv "DICTIONARY" "en_US") ;; hunspell default dictionary

(defun ni-script ()
  ""
  (interactive)
  (save-excursion
    (let ((start-pos (progn
                       (search-backward "<script>")
                       (move-beginning-of-line 2)
                       (point)))
          (end-pos (progn
                     (search-forward "</script>")
                     (move-beginning-of-line 1)
                     (point))))
      (ni-narrow-to-region-indirect-other-window
       start-pos
       end-pos 0 nil "script")
      (js3-mode)
      ))
  )

(require 'log-edit)
(require 'vc-git)
(require 'git-commit)

(add-hook 'git-commit-mode-hook 'turn-on-flyspell)

(require 'ido)
(ido-vertical-mode)

(defun my-set-export-face (&optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)
  (progn
    (set-face-foreground 'font-lock-comment-face "#aaa")
    (set-face-foreground 'font-lock-function-name-face "#04b")
    (set-face-foreground 'font-lock-keyword-face "#d00")
    (set-face-foreground 'font-lock-string-face "#080")
    (set-face-foreground 'font-lock-variable-name-face "#88F")
    )
)

(defun my-restore-export-face (&optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)
  (progn
    (set-face-foreground 'font-lock-comment-face "chocolate1")
    (set-face-foreground 'font-lock-function-name-face "LightSkyBlue")
    (set-face-foreground 'font-lock-keyword-face "cyan")
    (set-face-foreground 'font-lock-string-face "LightSalmon")
    (set-face-foreground 'font-lock-variable-name-face "LightGoldenrod")
    )
)

(advice-add 'org-html-export-to-html :before 'my-set-export-face)
(advice-add 'org-html-export-to-html :after 'my-restore-export-face)

(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'upcase-region 'disabled nil)


;; org-mode with plantuml?

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (plantuml . t)
     )))

(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2019.1/libexec/plantuml.jar")

(defun my/org-confirm-babel-evaluate (lang body)
  (not (member lang '("dot" "plantuml"))))
(setq org-confirm-babel-evaluate 'my/org-confirm-babel-evaluate)

(setq org-startup-with-inline-images t)

(defun my/org-redisplay-inline-images ()
  (interactive)
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(add-hook 'org-babel-after-execute-hook 'my/org-redisplay-inline-images)
