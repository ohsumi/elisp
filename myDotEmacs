
(add-to-list 'load-path "~/.emacs.d/clone/emacs-color-themes")
(setq ring-bell-function 'ignore)
(setq gc-cons-threshold 134217728)

(global-unset-key (kbd "C-o"))
(global-unset-key (kbd "C-q"))
(global-unset-key (kbd "C-o k"))
(global-unset-key (kbd "C-o a"))
(global-unset-key (kbd "C-o f"))
(global-set-key (kbd "C-o C-i") 'save-buffer)
(global-set-key (kbd "C-o C-o") 'delete-other-windows)
(global-set-key (kbd "C-o C-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "C-o C-p") (lambda ()
				  (interactive)
				  (split-window-horizontally)
				  (other-window 1)))
(global-set-key (kbd "C-o C-l") (lambda ()
				  (interactive)
				  (split-window-vertically)
				  (other-window 1)))


(require 'emacs-color-themes)
(if window-system
    (progn 
      (load-theme 'fogus t)))

;; Basic Option Settings.
;; (global-hl-line-mode nil)
;; (setq next-screen-context-lines 25)
;; (set-face-background hl-line-face "black")
(global-auto-revert-mode 1)
(setq kill-whole-line t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-default 'truncate-lines t)
(setq inhibit-startup-messsage t)
(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(set-language-environment "utf-8")
(setq make-backup-files nil)
(setq auto-save-default nil)
(blink-cursor-mode 1)
(scroll-bar-mode -1)
(auto-compression-mode t)

;;(require 'cask "~/.cask/cask.el")
;;(cask-initialize)

(require 'cl)
(server-start)
(unless (server-running-p)
  (server-start))

(defun get-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank))

(defun all-buffer-except-*scratch* ()
  "Kills all buffers except *scratch*"
  (interactive)
  (let ((buffers (buffer-list)) (safe '("*scratch*")))
    (while buffers
      (when (not (member (car buffers) safe))
        ;;(kill-buffer (car buffers))
        (print (car buffers))
        (setq buffers (cdr buffers))))))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun next-word (p)
  "Move point to the beginning of the next word, past any spaces"
  (interactive "d")
  (forward-word)
  (forward-word)
  (backward-word))

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof    proc))))

(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun delete-backward-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(defun previous-buffer ()
  "Select previous window."
  (interactive)
  (bury-buffer))

(defun backward-buffer ()
  "Select backward window."
  (interactive)
  (switch-to-buffer
   (car (reverse (buffer-list)))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; Core Settings.
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-w") 'other-window)
(global-set-key (kbd "C-j") 'backward-word)
(define-key lisp-interaction-mode-map
  (kbd "C-j") 'backward-word)
(global-set-key (kbd "C-t") 'scroll-down-command)
(global-set-key (kbd "C-x C-c") 'delete-window)

(add-to-list 'load-path "~/.emacs.d/clone/replace-colorthemes")
(add-to-list 'load-path "~/.emacs.d/clone/slack-el")
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/defuns")
(add-to-list 'load-path "~/.emacs.d/sly")
(add-to-list 'load-path "~/.emacs.d/elpa/sly-2.14")
(add-to-list 'load-path "~/.emacs.d/elpa/sly-2.14/contrib")
(add-to-list 'load-path "~/.emacs.d/clone/emacs-smartchr")

;; jumar
(add-to-list 'load-path "~/.emacs.d/clone/jumar")
(add-to-list 'load-path "~/.emacs.d/clone/erfi/lisp")

;;(require 'sly-autoloads)
(when (require 'auto-install nil t)
 (setq auto-install-directory "~/.emacs.d/elisp/"))
 ;;(auto-install-update-emacswiki-package-name t)
 ;;(auto-install-compatibility-setup)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(require 'ace-jump-helm-line)
(require 'helm-ag)
(require 'helm-config)
(require 'helm-swoop)
(require 'smex)
(require 'swiper)
(require 'swiper-helm)
(require 'gtags)
(require 'ggtags)
(require 'helm-gtags)
(setq gtags-suggested-key-mapping t)

(require 'all-ext)
(require 'elscreen)
(require 'ace-isearch)
(global-ace-isearch-mode 1)
(setq ace-isearch-jump-delay 0.18)
(setq ace-isearch-input-length 14)
(setq elscreen-prefix-key (kbd "C-o"))
(setq elscreen-tab-display-kill-control nil)
(elscreen-start)
(global-set-key (kbd "C-o C-c") 'elscreen-create)

(helm-mode 1)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
;; (define-key helm-map (kbd "C-u") 'ace-jump-helm-line)
(define-key helm-map (kbd "C-l") 'ace-jump-helm-line)
(define-key helm-map (kbd "C-j") 'delete-backward-word)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map  (kbd "C-j") 'delete-backward-word)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map  (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)

(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate 'kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

;; gtags and ggtags
(autoload 'gtags-mode "gtags" "" t)
(helm-gtags-mode 1)
(global-unset-key (kbd "C-l"))
(global-set-key (kbd "C-l c") 'list-colors-display)
(global-set-key (kbd "C-l C-t") 'helm-gtags-create-tags)
;; (global-set-key (kbd "C-l C-o") 'ggtags-create-tags)
(global-set-key (kbd "C-l C-r") 'ggtags-find-tag-regexp)
(global-set-key (kbd "C-l C-d") 'ggtags-find-definition)
;; (global-set-key (kbd "C-l C-v") 'ggtags-prev-mark)
(global-set-key (kbd "C-l C-m") 'ggtags-next-mark)
(global-set-key (kbd "C-l C-p") 'pop-tag-mark)
(global-set-key (kbd "C-l C-q") (lambda ()
				  (interactive)
				  (beginning-of-line)
				  (kill-line)
				  (yank)))

;; new prefix "C-o"
(global-set-key (kbd "C-o w") 'where-is)
(global-set-key (kbd "C-o h") 'helm-apropos)
(global-set-key (kbd "C-o v") 'describe-variable)
(global-set-key (kbd "C-o f") 'describe-function)
(global-set-key (kbd "C-o 9") 'goto-line)

(global-set-key (kbd "C-o C-u") 'helm-mini)
(global-set-key (kbd "C-l C-h") 'helm-mini)
(global-set-key (kbd "C-l C-w") 'helm-resume)
(global-set-key (kbd "C-l l") 'eval-last-sexp)
;; (global-set-key (kbd "C-q") 'helm-M-x)
;; (global-set-key (kbd "C-r") 'helm-M-x)

;; prefix "C-x"
(global-set-key (kbd "C-x C-u") 'eval-buffer)
(global-set-key (kbd "C-x C-x") 'describe-bindings)
(global-set-key (kbd "C-x C-z") 'eval-current-buffer)
(global-set-key (kbd "C-x C-d") 'describe-mode)
(global-set-key (kbd "C-x C-i") (lambda ()
				  (interactive)
				  (switch-to-buffer "*scratch*")))

(global-set-key (kbd "C-x C-o") (lambda ()
				  (interactive)
				  (find-file "~/.emacs")))
(global-set-key (kbd "C-x C-u") (lambda ()
				  (interactive)
				  (find-file "~/Helm.org")))

;; new prefix "C-l"
;; (global-set-key (kbd "C-l C-n") 'goto-line)
(global-set-key (kbd "C-l C-a") 'helm-ag)
(global-set-key (kbd "C-l C-k") 'helm-show-kill-ring)
;; (global-set-key (kbd "C-l C-f") 'helm-find-files)
;; (global-set-key (kbd "C-l C-f") 'ido-find-file)
(global-set-key (kbd "C-l C-s") 'helm-swoop)
(global-set-key (kbd "C-l C-u") 'helm-recentf)
(global-set-key (kbd "C-l C-h") 'keyboard-quit)
(global-set-key (kbd "C-l C-j") 'swiper-helm)
(global-set-key (kbd "C-l C-g") 'keyboard-quit)
(global-set-key (kbd "C-l ,") (lambda ()
				(interactive)
				(beginning-of-line)
				(kill-line)
				(kill-line)))
(global-set-key (kbd "C-l .") (lambda ()
				(interactive)
				(let ((char (char-to-string (char-after (point)))))
				  (cond
				   ((string= " " char) (delete-horizontal-space))
				   ((string-match "[\t]" char) (kill-word 0))
				   (t (forward-char) (backward-word) (kill-word 1))))))

(add-hook 'org-mode-hook (progn
			   (lambda ()
			     (setq helm-swoop-pre-input-function
				   (lambda () "")))))

;; Emacs Lisp 
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq debug-on-error nil)
(require 'slime-autoloads)
(require 'slime)
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(require 'rainbow-delimiters)
(require 'color)
(require 'cl-lib)
(slime-setup '(slime-repl))
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "ranbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 30))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)
(define-key slime-mode-map (kbd "C-c C-m") nil)
(define-key slime-mode-map (kbd "C-c d") 'slime-eval-defun)
(define-key slime-mode-map (kbd "C-c r") 'slime-eval-region)
(define-key slime-mode-map (kbd "C-c C-m") 'comment-or-uncomment-reion)

;; Quick Movement
(require 'ace-jump-mode)
(require 'avy-zap)
;; (global-set-key (kbd "C-u") 'ace-jump-mode)
(global-unset-key (kbd "C-_"))
(global-set-key (kbd "C-_") 'avy-zap-to-char)

(require 'sequential-command-config)
(require 'smooth-scroll)
(require 'yasnippet)
(require 'fuzzy)
(require 'helm-c-yasnippet)
(require 'auto-complete)
(require 'auto-complete-config)
(yas-global-mode t)
(global-set-key (kbd "C-c i") 'yas-insert-snippet)
(global-set-key (kbd "C-c n") 'yas-new-snippet)
(global-set-key (kbd "C-c e") 'yas-visit-snippet-file)
(global-set-key (kbd "C-l C-n") 'helm-c-yas-complete)
;; (global-set-key (kbd "C-l C-e") 'yas-expand)
(sequential-command-setup-keys)
(define-sequential-command setq-home
  beginning-of-line beginning-of-buffer setq-return)
(define-sequential-command setq-home
  end-of-line end-of-buffer setq-return)
;;(smooth-scroll-mode t)
(setq scroll-step 1)
(global-auto-complete-mode t)
(ac-config-default)
(setq ac-use-menu-map t)
(push 'ac-source-symbol ac-sources)
(setq ac-auto-start 2)
(setq ac-use-fuzzy t)
(add-to-list 'ac-modes 'org-mode)

;; Terminal
(require 'multi-term)
(setq multi-term-program "/usr/local/bin/zsh")
(global-set-key (kbd "C-c C-v") 'multi-term)
(setq term-unbind-key-list
      '("C-z" "C-x" "C-c" "C-h" "C-w" "C-o" "C-y" "C-u" "C-l" "C-t" "C-r" "C-q"))
(add-hook 'term-mode-hook
	  '(lambda ()
	     (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
	     (define-key term-raw-map (kbd "C-y") 'term-paste)))
	
;; browser and explorer
(require 'neotree)
(require 'ace-link)
(eval-after-load 'eww '(define-key eww-mode-map "f"
			 'ace-link-eww))
(ace-link-setup-default)
(global-set-key (kbd "C-o C-w") 'eww)
(global-set-key (kbd "C-o C-q") 'ace-link-eww)

(require 'anything)
(require 'smartrep)
(require 'smartchr)
;; new 
(global-set-key (kbd "=") (smartchr '("=" "==")))
(smartrep-define-key global-map "C-o"
  '(("k" . elscreen-next)
    ("j" . elscreen-previous)))
  
(require 'visual-regexp)
(require 'foreign-regexp)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" default)))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(foreign-regexp/regexp-type (quote ruby))
 '(reb-re-syntax (quote foreign-regexp)))

(require 'point-undo)
(require 'undo-tree)
(require 'goto-last-change)
(global-set-key (kbd "C-l C-z") 'undo-tree-visualize)
(global-set-key (kbd "C-l c") 'goto-last-change)

(require 'popwin)
(require 'ac-slime)
(require 'eldoc)
(require 'eldoc-extension)
(require 'elisp-slime-nav)
(require 'macrostep)
(push '("*slime-apropos*")          popwin:special-display-config)
(push '("*slime-macroexpansion*")   popwin:special-display-config)
(push '("*slime-description*")      popwin:special-display-config)
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
(push '("*slime-xref*")             popwin:special-display-config)
(push '(slime-repl-mode)            popwin:special-display-config)
(push '(slime-connection-list-mode) popwin:special-display-config)
(define-key emacs-lisp-mode-map (kbd "C-c e") 'macrostep-expand)

(require 'mykie)
(defvar vimlike-f-recent-char nil)
(defvar vimlike-f-recent-func nil)

(defun vimlike-f (char)
  "search to forward char into current line and move point (vim 'f' command)"
  (interactive "cSearch to forward char: ")
  (when (= (char-after (point)) char)
    (forward-char))
  (search-forward (char-to-string char) (point-at-eol) nil 1)
  ;; (migemo-forward (char-to-string char) (point-at-eol) t 1)
  (backward-char)
  (setq vimlike-f-recent-search-char char
        vimlike-f-recent-search-func 'vimlike-f))

(defun vimlike-F (char)
  "search to forward char into current line and move point. (vim 'F' command)"
  (interactive "cSearch to backward char: ")
  (search-backward (char-to-string char) (point-at-bol) nil 1)
  ;; (migemo-backward (char-to-string char) (point-at-bol) t 1)
  (setq vimlike-f-recent-search-char char
        vimlike-f-recent-search-func 'vimlike-F))

(defun vimlike-semicolon ()
  "search repeat recent vimlike 'f' or 'F' search char (vim ';' command)"
  (interactive)
  (if (and vimlike-f-recent-search-char
             vimlike-f-recent-search-func)
      (funcall vimlike-f-recent-search-func vimlike-f-recent-search-char)
    (message "Empty recent search char.")))

(mykie:global-set-key "C-l ;"
  :default vimlike-f
  :region kill-region)

(mykie:global-set-key "C-l C-l"
  :default vimlike-F
  :region  copy-region-as-kill)

(require 'my-util)
(global-set-key (kbd "C-o C-r") 'resize)

;; unused function. change key bind.
(global-set-key (kbd "C-l i") 'my-util-delete-between-pair)

;; prefix "C-c"
(global-set-key (kbd "C-c C-m") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-l") '(lambda ()
				 (interactive)
				 (recenter nil)))
(global-set-key (kbd "C-c C-k") '(lambda ()
				 (interactive)
				 (recenter 0)))
(global-set-key (kbd "C-c C-j") '(lambda ()
				 (interactive)
				 (recenter -1)))

(require 'quickrun)
(require 'python-mode)
(require 'python-environment)
(define-key python-mode-map (kbd "C-j") 'backward-word)
(define-key python-mode-map (kbd "C-c C-c") nil)
(define-key python-mode-map (kbd "C-c C-c") 'quickrun)
(define-key python-mode-map (kbd "C-c C-v") nil)
(define-key python-mode-map (kbd "C-c C-v") 'multi-term)
(define-key python-mode-map (kbd "C-c") nil)
(define-key python-mode-map (kbd "C-c C-m") 'comment-or-uncomment-region)
;;(define-key ruby-mode-map (kbd "C-c C-c") nil)
;;(define-key ruby-mode-map (kbd "C-c C-c") 'quickrun)

;;(require 'phi-search)
;;(global-set-key (kbd "C-s") 'phi-search)
;;(global-set-key (kbd "C-r") 'phi-search-backward)

(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(global-set-key (kbd "C-l C-h") 'highlight-symbol-at-point)

;; Ruby
(add-to-list 'load-path "~/.emacs.d/rcodetools")
(require 'inf-ruby)
(require 'flycheck)
(require 'flycheck-pos-tip)
(require 'helm-flycheck)
(require 'robe)
(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun ruby-mode-hook-rcodetools ()
  ;;(define-key ruby-mode-map (kbd "C-x C-c") 'rct-complete-symbol)
  (define-key ruby-mode-map (kbd "C-x C-c") nil)
  (define-key ruby-mode-map (kbd "C-x C-m") 'xmp)
  (define-key ruby-mode-map (kbd "C-c C-l") 'recenter))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)
(defun make-ruby-scratch-buffer ()
  (with-current-buffer (get-buffer-create "*ruby scratch*")
    (ruby-mode)
    (current-buffer)))
(defun ruby-scratch ()
  (interactive)
    (pop-to-buffer (make-ruby-scratch-buffer)))

;; (add-hook 'ruby-mode-hook
;; 	  '(lambda ()
;; 	     (setq flycheck-checker 'ruby-rubocop)
;; 	     (flycheck-mode 1)))
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
(setq rct-find-tag-if-available nil)
;; (add-hook 'ruby-mode-hook 'flycheck-mode)
;; (add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)
;; (add-hook 'R-mode-hook 'flycheck-mode)

;; Org
(require 'org)
;;(require 'orgtbl-aggregate)
;;(require 'org-present)
;;(require 'org-linkany)
;;(require 'org-babel)
(require 'open-junk-file)
(require 'ob-ruby)
(require 'ob-python)
(require 'calfw)
(require 'table)

(define-key org-mode-map (kbd "C-j") 'backward-word)
(define-key org-mode-map (kbd "C-c") nil)
(define-key org-mode-map (kbd "C-c t") nil)
(define-key org-mode-map (kbd "C-c C-c") nil)
(define-key org-mode-map (kbd "C-c C-t") 'org-todo)
(define-key org-mode-map (kbd "C-c C-v") 'multi-term)
(define-key org-mode-map (kbd "C-c C-p") 'org-capture)
(define-key org-mode-map (kbd "C-c C-s") 'org-time-stamp)
(define-key org-mode-map (kbd "C-c C-l") 'org-store-link)
(define-key org-mode-map (kbd "C-c C-u") 'org-meta-return)
(define-key org-mode-map (kbd "C-c C-i") 'org-insert-link)
(define-key org-mode-map (kbd "C-c C-o") 'org-open-at-point)
(define-key org-mode-map (kbd "C-c C-b") 'org-toggle-checkbox)
(define-key org-mode-map (kbd "C-c C-h") 'org-insert-todo-heading)
(define-key org-mode-map (kbd "C-c C-c") 'org-babel-execute-src-block)
;; subtree, upheading, heading
(define-key org-mode-map (kbd "C-c C-s") 'org-insert-subheading)
(define-key org-mode-map (kbd "C-c C-h") 'org-insert-heading)
(define-key org-mode-map (kbd "C-c C-a") 'ace-link-org)
(define-key org-mode-map (kbd "C-c C-j") 'org-metaright)
(define-key org-mode-map (kbd "C-c C-k") 'org-metaleft)
;; recenter.
(define-key org-mode-map (kbd "C-c C-l") nil)
(define-key org-mode-map (kbd "C-c C-k") nil)
(define-key org-mode-map (kbd "C-c C-j") nil)

(defun my-org-confirm-babel-evaluate (lang body)
  (not (or (string= lang "emacs-lisp")
           (string= lang "ruby")
	   (string= lang "python"))))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
;; org-comment-dwim, org-previous-visible-heading, outline-up-heading
;; org-toggle-heading



(setq open-junk-file-format "~/SFC/Org/junk/%Y-%m%d-%H%M.")
(global-set-key (kbd "C-x j") 'open-junk-file)
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)

;; JavaScript Development.
(require 'moz)
(require 'my-moz)
(autoload 'nodejs-repl "nodejs-repl" "Run Node.js REPL" t)
(setq nodejs-repl-prompt "node> ")
(defun javascript-custom-setup ()
  (moz-minor-mode 1))
(add-hook 'javascript-mode-hook 'javascript-custom-setup)
(add-hook 'js2-mode-hook 'javascript-custom-setup)
(global-set-key (kbd "C-q C-m") 'inferior-moz-switch-to-mozilla)
(global-set-key (kbd "C-q C-j") 'moz-send-defun)
(global-set-key (kbd "C-q C-l") 'moz-send-line)
(global-set-key (kbd "C-q C-y") 'moz-send-region)
(global-set-key (kbd "C-q C-b") 'moz-save-buffer-and-send)

;; (defun auto-reload-firefox-on-after-save-hook ()         
;;           (add-hook 'after-save-hook
;;                        '(lambda ()
;;                           (interactive)
;;                           (comint-send-string (inferior-moz-process)
;;                                               "setTimeout(BrowserReload, \"1000\");"))
;;                        'append 'local)) ; buffer-local
;; (add-hook 'web-mode-hook 'auto-reload-firefox-on-after-save-hook)

;; PostgreSQL
(require 'sql)
(require 'db-pg)
(require 'pg)
(require 'pgdevenv)
(require 'sql-indent)
(eval-after-load "sql"
  '(load-library "sql-indent"))
(setq sql-indent-offset 2)
(sql-set-product "postgres")

(add-to-list 'load-path "~/.emacs.d/clone/helm-R")
(add-to-list 'load-path "~/.emacs.d/clone/free-keys")

(require 'ess)
(require 'ess-site)
(require 'helm-R)
(require 'use-package)
(use-package csv-mode)
(setq auto-mode-alist
      (cons (cons "\\.[rR]$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
(setq ess-ask-for-ess-directory nil)
(make-variable-buffer-local 'comment-add)
(ess-toggle-underscore nil)
(setq ess-fancy-comments t)
(setq comment-add 0)
(setq ess-use-auto-complete t)
(define-key ess-mode-map (kbd "C-c C-v") 'multi-term)
(use-package helm-R
  :config
  (setq ess-use-ido nil))
(define-key ess-mode-map (kbd "C-c C-f") 'ess-beginning-of-function)
(define-key ess-mode-map (kbd "C-c C-e") 'ess-end-of-function)
(define-key ess-mode-map (kbd "C-c C-a") 'ess-mark-function)
(define-key ess-mode-map (kbd "C-c C-l") '(lambda ()
					    (interactive)
					    (recenter nil)))
(define-key ess-mode-map (kbd "C-c C-k") '(lambda ()
					    (interactive)
					    (recenter 0)))
(define-key ess-mode-map (kbd "C-c C-j") '(lambda ()
					    (interactive)
					    (recenter -1)))
					    

(defun forward-word-to-beginning (&optional n)
  "Move point forward n words and place cursor at the beginning."
  (interactive "p")
  (let (myword)
    (setq myword
	  (if (and transient-mark-mode mark-active)
	      (buffer-substring-no-properties (region-beginning) (region-end))
	    (thing-at-point 'symbol)))
    (if (not (eq myword nil))
	(forward-word n))
    (forward-word n)
    (backward-word n)))

(global-set-key (kbd "C-l '")   'my-util-get-boundary-and-thing)
(global-set-key (kbd "C-l :") 'my-util-get-boundary-and-thing)

(require 'jaunte)
(require 'symbol-jaunte)
(global-set-key (kbd "C-c C-j") 'symbol-jaunte)

(unless window-system
  (progn (global-unset-key (kbd "C-z"))
	 (global-set-key   (kbd "C-z") 'undo)
	 (global-set-key (kbd "C-u") 'ace-jump-mode)
	 (require 'w3m)
	 (require 'my-w3m)
	 (setq w3m-mode-page "http://www.google.co.jp/")
	 (global-unset-key (kbd "C-o C-f"))
	 (global-set-key (kbd "C-o C-f") 'w3m-search)
	 (add-hook 'w3m-mode-hook
		   '(lambda ()
		      (define-key w3m-mode-map "t" 'scroll-down)
		      (define-key w3m-mode-map "v" 'scroll-up)
		      (define-key w3m-mode-map "l" 'ace-link-eww)
		      (define-key w3m-mode-map "a" 'beginning-of-buffer)
		      (define-key w3m-mode-map "n" 'my-w3m-google-link)
		      (define-key w3m-mode-map "k" 'my-w3m-google-next-page)
		      (define-key w3m-mode-map "p" 'my-w3m-google-backward-link)))))

(if window-system
    (progn  (mykie:global-set-key "C-l C-;"
	      :default vimlike-f :region kill-region)
	    ;; (find-file "~/Helm.org")
	    (global-set-key (kbd "C-z") 'undo)
	    (global-unset-key (kbd "C-/"))      
	    ;;(global-set-key (kbd "C-/") 'avy-zap-to-char)
	    (global-set-key (kbd "C-/ C-/") 'avy-zap-to-char)
	    (global-set-key (kbd "C-l C-:") 'my-util-get-boundary-and-thing)
	    (global-set-key (kbd "C-;") 'forward-word-to-beginning)
	    ;; (global-set-key (kbd "C-.") 'jaunte)
	    ;; new prefix "C-,"
	    (global-unset-key (kbd "C-,"))
	    ;;(global-set-key (kbd "C-, C-,") 'delete-backward-char)
	    ;;(global-set-key (kbd "C-l C-j") 'jaunte)
	    (global-set-key (kbd "C-l C-,") (lambda ()
					      (interactive)
					      (beginning-of-line)
					      (kill-line)
					      (kill-line)))
	    (global-set-key (kbd "C-l C-.") (lambda ()
					      (interactive)
					      (let ((char (char-to-string (char-after (point)))))
						(cond
						 ((string= " " char) (delete-horizontal-space))
						 ((string-match "[\t]" char) (kill-word 0))
						 (t (forward-char) (backward-word) (kill-word 1))))))))

;;(setq jaunte-hint-unit 'symbol)
;;(global-set-key (kbd "C-,")
;;(global-set-key (kbd "C-.") '
;;(global-set-key (kbd "C-c .") ')
;;(global-set-key (kbd "C-c ,") ')

;; Regexp
(require 'dired)
(require 'wdired)
(require 'moccur-edit)
(require 'dired-filter)
(require 'helm-c-moccur)
(setq dired-recursive-copies 'always)
(setq dired-isearch-filenames t)
(add-to-list 'dired-compress-file-suffixes '("\\.zip\\'" ".zip" "unzip"))
;; (1) [C-l C-g] : moccur-grep-find
;; (2) [r]       : change to insert state.
;; (3) [C-l C-q] : M-% (query-replace)
;; (global-set-key (kbd "C-l C-m") 'moccur-grep-find)
;; (global-set-key (kbd "C-l C-q") 'query-replace)

;; under testing
(ido-mode 1)
(ido-everywhere 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)
;;(global-unset-key (kbd "C-l x"))
;;(global-set-key (kbd "C-l C-i") 'ido-switch-buffer)
;;(global-set-key (kbd "C-l x") 'imenu-anywhere)

;; (require 'google-this)
;; (google-this-mode 1)
;; (global-set-key (kbd "C-o C-g") 'google-this)
;; (require 'back-button)
;; (require 'visible-mark)
;; (back-button-mode 1)
;; (unless window-system

;; (require 'god-mode)
;; (global-set-key (kbd "C-,") 'god-local-mode) 
;; (define-key god-local-mode-map (kbd "g") 'god-local-mode)))

;; addtional settings : indent-region, previous-buffer
(global-set-key (kbd "C-l C-i") 'indent-region)
(global-set-key (kbd "C-l C-b") 'previous-buffer)

;; (require 'which-key)
;; (which-key-mode)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(unless window-system
  (progn (set-face-attribute 'mode-line-inactive nil
			     :underline nil
			     :background (face-background 'default))
	 (set-face-background 'default "#000000")))

;;(require 'ace-window)
;;(setq aw-keys '(?f ?n ?k ?p ?e ?a ?j))
;;(global-set-key (kbd "C-l C-w") 'ace-window)

;; (unless window-system
;;   (progn (require 'moe-theme)
;; 	 (moe-light)
;; 	 (moe-theme-set-color 'magenta)
;; 	 (set-face-background 'default "#000000")
;; 	 (require 'powerline)
;;          ;; blue, orange, green ,magenta, yellow, purple, red, cyan ..
;; 	 (powerline-vim-theme)
;; 	 ))

;; Org
(add-to-list 'load-path "~/.emacs.d/clone/avy-migemo")
(require 'migemo)
(require 'avy-migemo)
(require 'helm-migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(migemo-init)
(avy-migemo-mode 1)

;; (define-minor-mode overriding-minor-mode
;;   "http://d.hatena.ne.jp/rubikitch/20101126/keymap" t ""
;;   `((,(kbd "C-t") . other-window-or-sprit)))


(require 'json-reformat)
(require 'tex-mode)
(require 'yatex)
(add-hook 'yatex-mode-hook
	  (lambda ()
	    (define-key tex-mode-map (kbd "C-c C-v") 'multi-term)
	    (define-key tex-mode-map (kbd "C-j") 'backward-word)))
(define-key tex-mode-map (kbd "C-c C-v") nil)
(define-key tex-mode-map (kbd "C-c C-v") 'multi-term)
(define-key tex-mode-map (kbd "C-j") nil)
(define-key tex-mode-map (kbd "C-j") 'backward-word)

(global-set-key (kbd "C-o C-i") 'save-buffer)
(global-set-key (kbd "C-o C-o") 'delete-other-windows)
(global-set-key (kbd "C-o C-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "C-o C-p") (lambda ()
				  (interactive)
				  (split-window-horizontally)
				  (other-window 1)))
(global-set-key (kbd "C-o C-l") (lambda ()
				  (interactive)
				  (split-window-vertically)
				  (other-window 1)))

(load-theme 'graham t)

;; diff command
(defun diff-mode-setup-faces ()
  (set-face-attribute 'diff-added nil
		      :foreground "white" :background "dark green")
  (set-face-attribute 'diff-removed nil
		      :foreground "white" :background "dark red")
  (set-face-attribute 'diff-refine-change nil
		      :foreground nil :background nil
		      :weight 'bold :inverse-video t))
  
(defun diff-mode-refine-automatically ()
  (diff-auto-refine-mode t))

(add-hook 'diff-mode-hook 'diff-mode-setup-faces)
(add-hook 'diff-mode-hook 'diff-mode-refine-automatically)

(require 'jumar)
(require 'jumar-dwim)
(require 'erfi-emacs)
(add-hook 'jumar-post-jump-hook 'erfi-emacs-hl-turn-on-until-next-command)
;; (jumar-dwim-use-preconfigured-scheme 'list+history)
;; (jumar-init)
;; (global-set-key (kbd "C-o C-j") 'jumar-dwim-add-marker)
;; (global-set-key (kbd "C-o C-h") 'helm-jumar-dwim-jumarkers)
;; (smartrep-define-key global-map "C-o"
;;   '(("C-v" . jumar-dwim-jump-backward)
;;     ("C-h" . helm-jumar-dwim-jumarkers)
;;     ("C-b" . jumar-dwim-jump-forward)))

;; C-mode
(require 'c-eldoc)
(setq auto-mode-alist (cons '("\\.l$" . c-mode) auto-mode-alist))
(define-key c-mode-map (kbd "C-c C-l") nil)
(define-key c-mode-map (kbd "C-c C-l") 'recenter)

;; regexp
(require 'multiple-cursors)
(require 'visual-regexp-steroids)
(require 'expand-region)
(smartrep-define-key global-map "C-l"
  '(("C-e" . er/expand-region)))
(global-set-key (kbd "C-l C-q") 'vr/query-replace)

(require 'helm-rb)
(defun recenter-jaunte (p)
  (interactive "p")
  (jaunte)
  (recenter nil))
;; (global-set-key (kbd "C-u") 'recenter-jaunte)

(defun move-end-of-word ()
  (interactive)
  (search-forward " ")
  (backward-char 2))

;; next-word
;; (global-set-key (kbd "C-u") 'next-word)
;; (global-set-key (kbd "C-l C-f") 'ace-jump-mode)
(global-set-key (kbd "C-l C-h") 'ido-find-file)
(global-set-key (kbd "C-l C-c") 'helm-find-files)
(global-set-key (kbd "C-l C-v") 'goto-last-change)

(require 'bm)
(require 'helm-bm)
(custom-set-faces
 '(bm-face ((t (:background "color-27" :foreground "color-239"))))
 '(linum ((t (:background "black" :foreground "blue")))))
(global-set-key (kbd "C-c C-a") 'bm-toggle)
(define-key c-mode-map (kbd "C-c C-a") 'bm-toggle)
(global-set-key (kbd "C-c C-f") 'helm-bm)
(define-key c-mode-map (kbd "C-c C-f") 'helm-bm)

(global-set-key (kbd "C-l C-h") 'highlight-symbol-at-point)
(define-key ess-mode-map (kbd "#") (smartchr '("## " "#" "# ")))

(defun close-paren-at-point-p ()
  "Check closed paren at point."
  (let ((s (char-to-string (char-after (point)))))
    (s-contains? s ")]}")))

(defun not-paren-matching-at-point-p ()
  "Check not matching paren at point."
  (let ((s (char-to-string (char-after (point)))))
    (not (s-contains? s "{}[]()"))))

(defun goto-matching-paren ()
  "Jump to matching paren."
  (interactive)
  (cond ((close-paren-at-point-p)
	 (forward-char)
	 (-if-let (p (show-paren--default))
	     (goto-char (nth 2 p))
	   (backward-char)))
	((not-paren-matching-at-point-p)
	 (when (search-forward-regexp "[(\\[\[{)}]" (point-at-eol) t 1)
	   (backward-char)))
	(t
	 (-if-let (p (show-paren--default))
	     (goto-char (nth 2 p))))))

;; under testsing.
;; (global-unset-key (kbd "C-s"))
;; (global-unset-key (kbd "C-r"))
;; (global-set-key (kbd "C-r") 'jaunte)
;; (global-set-key (kbd "C-s") 'next-word)
(global-set-key (kbd "C-l f") '(lambda ()
				  (interactive)
				  (backward-char)
				  (goto-matching-paren)
				  (recenter 0)))

(global-set-key (kbd "C-l C-f") '(lambda ()
				   (interactive)
				   (backward-char)
				   (goto-matching-paren)))

(global-set-key (kbd "C-l C-w")
		(lambda () (interactive) (other-window -1)))

;; back-to-indentation
;; forward-word
;; C-x h => mark-whole-buffer

;; JavaScript
;; Web
(require 'web-mode)
(require 'php-mode)
(require 'zencoding-mode)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
;; (define-key emmet-mode-keymap (kbd "<TAB>") 'emmet-expand-line)
(add-to-list 'load-path "~/.emacs.d/clone/impatient-mode")
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;; (require 'simple-httpd)
;; (require 'htmlize)
;; (require 'impatient-mode)
;; (setq httpd-root "/Users/taka/.emacs.d/elpa/skewer-mode-20150914.1304")
;; (setq httpd-root "/Users/taka/")
;; (httpd-start)
;; helm-M-x => httpd-start => impatient-mode => fail.

;;(define-key js2-mode-map (kbd "C-c :") 'eval-expression)
;;(global-set-key (kbd "C-c C-") 'run-skewer)
;;(global-set-key (kbd "C-c C-r") 'skewer-repl)
;;(global-set-key (kbd "C-c C-r") 'skewer-eval-last-expression)
(require 'skewer-mode)
(require 'url-util)
(require 'http-get)
(require 'http-cookies)

;; (require 'deferred)
;; (require 'inertial-scroll)
;; (setq inertias-initial-velocity 60)
;; (setq inertias-friction 200)
;; (setq inertias-global-minor-mode-map 
;;       (inertias-define-keymap
;;        '(
;;          ("C-s"     . inertias-up-wheel)
;;          ("C-r"     . inertias-down-wheel)
;;          ) inertias-prefix-key))
;; (inertias-global-minor-mode 1)

(smartrep-define-key global-map "C-o"
  '(("o" . next-word)))

(defservlet skewer/demo text/html ()
  ;; default 
  ;;(insert-file-contents (expand-file-name "index.html" "~/public_html/")))
  (setq current-file-name (expand-file-name (buffer-name (window-buffer))))
  (if (file-exists-p current-file-name)
      (insert-file-contents current-file-name)))

;;(insert-file-contents (expand-file-name "index.html" "~/public_html/")))
;;(insert-file-contents (expand-file-name "index.html" "~/Documents/fit1-anime/animation/")))

(defun open-this-buffer-file ()
  (interactive)
  (setq current-file (expand-file-name (buffer-name (window-buffer)))) ;; current file name.
  (if (file-exists-p current-file)
      (if (eq major-mode 'web-mode)
	  (progn (shell-command (concat "open " current-file))))))

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
(add-hook 'html-mode-hook 'web-mode-hook)

(defvar moz-scroll-ratio "60")
(defvar moz-scroll-time "60")

(defun moz-send-line (str)
  (interactive)
  (comint-send-string (inferior-moz-process)
                      (concat moz-repl-name ".pushenv('printPrompt', 'inputMode'); "
                              moz-repl-name ".setenv('inputMode', 'line'); "
                              moz-repl-name ".setenv('printPrompt', false); undefined; "))
  (comint-send-string (inferior-moz-process) (concat str "; "))
  (comint-send-string (inferior-moz-process)
                      (concat moz-repl-name ".popenv('inputMode', 'printPrompt'); undefined;\n")))

(defun moz-prev-tab ()
  (interactive)
  (moz-send-line "gBrowser.mTabContainer.advanceSelectedTab(-1, true)"))

(defun moz-next-tab ()
  (interactive)
  (moz-send-line "gBrowser.mTabContainer.advanceSelectedTab(1, true)"))

(defun moz-open-uri-in-new-tab (uri &optional param)
  (let ((p (if param param "")))
    (moz-send-message
     (concat
      "gBrowser.selectedTab = gBrowser.addTab();\n"
      (format
       "content.location=\"%s%s\";\n"
       uri
       (http-url-encode p 'utf-8))))))

(defun moz-google-search (word)
  (interactive "sSearch Word: ")
  (moz-open-uri-in-new-tab "http://www.google.co.jp/search?hl=ja&q=" word))

(defun moz-undo-close-tab ()
  (interactive)
  (comint-send-string (inferior-moz-process) "undoCloseTab();"))

(defun moz-tab-close ()
  "Close current tab"
  (interactive)
  (moz-send-message "content.window.close();"))

(global-unset-key (kbd "C-q"))
(smartrep-define-key global-map "C-q"
  '(;; ("j" . run-skewer)
    ;; ("a" . moz-prev-tab)
    ;; ("f" . moz-next-tab)
    ;; ("g" . keyboard-quit)
    ;; ("k" . moz-tab-close)
    ;; ("t" . my-moz-scrollup)
    ;; ("v" . my-moz-scrolldown)
    ;; ("p" . my-moz-scrollup-1)
    ;; ("h" . moz-google-search)
    ;; ("n" . my-moz-scrolldown-1)
    ;; ("r" . my-moz-browser-reload)
    ("C-o" . open-this-buffer-file)
    ;; ("z" . moz-undo-close-tab)))
    ))

;;(global-set-key (kbd "c-x ret <up>") 'moz-scroll-up) ;; C-x C-m C-p
;;(global-set-key (kbd "c-x ret <down>") 'moz-scroll-down) ;; C-x C-m C-n
;;(global-set-key (kbd "c-x ret del") 'moz-prev-tab) ;; C-x C-m C-h
;;(global-set-key (kbd "c-x ret c-l") 'moz-next-tab) ;; C-x C-m C-l

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq zencoding-indentation 0)
  (define-key html-mode-map (kbd "C-c C-v") nil)
  (define-key html-mode-map (kbd "C-c C-v") 'multi-term)
  (define-key html-mode-map (kbd "C-c C-o") nil)
  (define-key html-mode-map (kbd "C-c C-o") 'browse-url-of-buffer)
  (define-key html-mode-map (kbd "C-c C-p") nil)
  (define-key html-mode-map (kbd "C-c C-p") 'find-file-at-point)
  (define-key html-mode-map (kbd "C-c C-l") nil)
  (define-key html-mode-map (kbd "C-c C-l") 'recenter)
  (define-key js2-mode-map (kbd "C-c C-a") nil)
  (define-key js2-mode-map (kbd "C-c C-f") nil)
  (define-key html-mode-map (kbd "C-c C-a") 'bm-toggle)
  (define-key html-mode-map (kbd "C-r") 'helm-M-x)
  (define-key skewer-mode-map (kbd "C-r") 'helm-M-x)
  (define-key skewer-html-mode-map (kbd "C-r") 'helm-M-x)
  (define-key web-mode-map (kbd "C-c C-m") nil)
  (define-key web-mode-map (kbd "C-c C-m") 'web-mode-comment-or-uncomment)
  (define-key html-mode-map (kbd "C-c C-f") 'helm-bm))

(defun web-mode-indent (num)
  (interactive "nIndent: ")
  (setq web-mode-markup-indent-offset num)
  (setq web-mode-css-indent-offset num)
  (setq web-mode-style-padding num)
  (setq web-mode-code-indent-offset num)
  (setq web-mode-script-padding num)
  (setq web-mode-html-offset 2)
  (setq web-mode-block-padding num))

(defun web-mode-hook2 ()
  (setq web-mode-markup-indent-offset 2))


(autoload 'js2-mode "j2-mode" nil t)
(add-to-list 'auto-mode-alist '("\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          (lambda () (tern-mode t)))
 
(eval-after-load 'tern
   '(progn (require 'tern-auto-complete)
      (tern-ac-setup)))

(global-set-key (kbd "C-q C-t") 'tern-get-type)
(global-set-key (kbd "C-q C-d") 'tern-get-docs)
;;C-c C-c         tern-get-type
;;C-c C-d         tern-get-docs
;;C-c C-r         tern-rename-variable
(add-hook 'js2-mode-hook '(lambda ()
			    (flymake-mode t)
			    (require 'flymake-jshint)
			    (flymake-jshint-load)))
(global-set-key (kbd "C-q C-m") 'flymake-jshint-load)
(add-hook 'web-mode-hook 'my-web-mode-hook)
(add-hook 'web-mode-hook 'web-mode-hook2)

;; Memo for 'shadow' pkg.
;; (kill-region (- (point) 10) (point))
;; (setq jaunte-hint-unit 'line)

(defun setColorForJaunte (c1 c2 c3 c4)
  (set-face-foreground 'jaunte-hint-face c1)
  (set-face-background 'jaunte-hint-face c2)
  (set-face-foreground 'jaunte-hint-face2 c3)
  (set-face-background 'jaunte-hint-face2 c4))

(defun shadow-f (f)
  (save-excursion
    (interactive)
    (setq jaunte-hint-unit 'symbol)
    (setColorForJaunte "gray" "blue" "blue" "gray")
    (jaunte)
    (beginning-of-line)
    (let (pre post preBuffer postBuffer)
      (setq pre (point))
      (setq preBuffer (buffer-name))
      (set-mark (point))
      (setColorForJaunte "red" "pink" "color-226" "color-201")
      (jaunte)
      (setq postBuffer (buffer-name))
      (if (not (string= preBuffer postBuffer))
	  (keyboard-quit)
	(progn (end-of-line)
	       (forward-char)
	       (setq post (point))
	       (funcall f pre post))))))

(defun shadow-comment-or-uncomment-region ()
  (interactive)
  (shadow-f 'comment-or-uncomment-region))

(defun shadow-kill-region ()
  (interactive)
  (shadow-f 'kill-region))

(defun shadow-f-line (f)
  (interactive)
  (setColorForJaunte "blue" "gray" "gray" "black")
  (jaunte)
  (let (start end)
    (beginning-of-line)
    (setq start (point))
    (end-of-line)
    (setq end (point))
    (funcall f start end)))

(defun shadow-kill-line ()
  (interactive)
  (shadow-f-line 'kill-region))

(defun shadow-copy-line ()
  (interactive)
  (save-excursion
    (shadow-f-line 'copy-region-as-kill)))
 
(global-set-key (kbd "C-l m") 'shadow-comment-or-uncomment-region)
(global-set-key (kbd "C-l d") 'shadow-kill-line)
(global-set-key (kbd "C-l j") 'shadow-copy-line)
(global-set-key (kbd "C-l k") 'shadow-kill-region)

(defun open-small-window-f (f)
  (interactive)
  (funcall f)
  (other-window 1)
  (funcall f)
  (other-window 1)
  (other-window -1)
  (delete-window))

(global-set-key (kbd "C-o p") '(lambda ()
				 (interactive)
				 (open-small-window-f 'split-window-horizontally)))

(global-set-key (kbd "C-o l") '(lambda ()
				 (interactive)
				 (open-small-window-f 'split-window-vertically)))


(defun select-function-switching-by-major-mode ()
  "Under development. Select function's region of its major mode."
  (interactive)
  (save-excursion
    (cond ((eq major-mode 'c-mode) (message "Hello C mode"))
	  ((eq major-mode 'ess-mode) (message "Hello ess mode"))
	  ((eq major-mode 'lisp-mode) (message "Hello Lisp mode"))
	  ((eq major-mode 'emacs-lisp-mode) (message "Hello emacs lisp mode"))
	  (t (message "Hello default. Do nothing.")))))

(global-set-key (kbd "C-l t") 'select-function-switching-by-major-mode)

;; (call-process "ls" nil t nil)
;; (defun delete-files (extension)
;; (interactive)
;; (call-process ...)
;; ==> "find dir_name -name "*.org" | xargs rm"
;; or....
;; ==> "make"

;; (setq case-fold-search nil)
;; (defun search-camel-case-backward ()
;;   (interactive)
;;   (backward-char)
;;   (re-search-backward (rx (in "A-Z"))))
;; (defun search-camel-case-forward ()
;;   (interactive)
;;   (forward-char)
;;   (re-search-forward (rx (in "A-Z"))))
;; (global-set-key (kbd "C-l t") 'search-camel-case-forward)
;; (global-set-key (kbd "C-l y") 'search-camel-case-backward)
;; http://d.hatena.ne.jp/tomoya/20101213/1292166026					
;; (what-cursor-position)

;; insert-space for JS editing.
;; 1,2,3 => 1, 2, 3

(global-set-key (kbd "C-q C-q") 'helm-M-x)
(global-set-key (kbd "C-u") 'ace-jump-mode)
;; (global-set-key (kbd "C-u") '(lambda ()
;; 			       (interactive)
;; 			       (setq jaunte-hint-unit 'symbol)
;; 			       (setColorForJaunte "black" "blue" "gray" "cyan")
;;			       (jaunte)))

;; under development.
;; (defun gcc-current-buffer ()
;;   (interactive)
;;   (setq current-file (expand-file-name (buffer-name (window-buffer))))
;;   (if (file-exists-p current-file)
;;       (if (eq major-mode 'c-mode)
;; 	  (progn (shell-command (concat "gcc " current-file))))))

(require 'pretty-symbols)
(require 'purty-mode)
(setq pretty-symbol-categories '(lambda nil))
;; (add-hook 'emacs-lisp-mode-hook 'pretty-symbols-mode)
;; (add-hook 'skewer-mode-hook 'pretty-symbols-mode)
;; (add-hook 'js2-mode 'pretty-symbols-mode)
;; (add-hook 'ruby-mode-hook 'pretty-symbols-mode)
(purty-add-pair '("\\(\\bfunction\\b\\)" . "ƒ"))
(add-hook 'js-mode-hook #'purty-mode)
;; (add-hook 'js-mode-hook
;;           (lambda ()
;;             (push '("function" . ?ƒ) prettify-symbols-alist)
;;             (prettify-symbols-mode)))

;; weather information
(require 'wttrin)
(setq wttrin-default-cities '("Tokyo" "Japan"))
(global-set-key (kbd "C-l w") 'wttrin)

;; delete and indent between 'if(..){' and '}' by 2 times jaunte.
(defun deleteStmntAndIndentation()
  ())

(global-set-key (kbd "C-l b") 'beginning-of-defun)
(global-set-key (kbd "C-u") 'jaunte)

;; Erlang
(require 'erlang)
(require 'erlang-start)
(add-to-list 'load-path "~/.emacs.d/clone/distel/elisp")
(require 'distel)
(distel-setup)

;; Haskell
(require 'haskell-mode)
(require 'haskell-tab-indent)

;; English 
; (setq-default ispell-program-name "aspell")
; (eval-after-load "ispell"
;   '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
; (setq-default ispell-program-name "/usr/local/bin/aspell")
; (global-set-key (kbd "C-q C-i") 'ispell-buffer)
; (add-to-list 'load-path "~/.emacs.d/ht.el-master/")
; (add-to-list 'load-path "~/.emacs.d/grammar.el-master/")
; (require 'ht)
; (require 'request)
; (require 'grammar)

;; org presentation
(require 'org-tree-slide)
;; (defun backward-word-plus ;; backward-word
;;     (interactive)
;;   (previous-line)
;;   (end-of-line)
;;   (backward-word)
;;   (backward-word))
;; (global-set-key (kbd "C-l u") 'backward-word-plus)

;; Scala
(setenv "PATH" (concat "/usr/local/bin/sbt:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin/scala:" (getenv "PATH")))
(require 'scala-mode)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; for python(org) indentation
;; insert these strings(a, b, c, d) like 'ace-jump'
;; and utilize one of them to find the place
;; where the user want to move the cursor by judging the previous line.
;; like "a   b    c    d  e    f   g"
