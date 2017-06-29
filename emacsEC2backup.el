(fset 'yes-or-no-p 'y-or-n-p)
(setq auto-save-default nil)
(blink-cursor-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(setq kill-whole-line t)
(setq-default truncate-lines t)
(load-theme 'tango-dark t)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-_") nil)
(global-set-key (kbd "C-_") 'helm-M-x)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'helm)
(require 'helm-ag)
(require 'helm-config)
(require 'swiper-helm)
(require 'ace-jump-mode)
(global-set-key (kbd "C-l") nil)
(global-set-key (kbd "C-o") nil)
(global-set-key (kbd "C-w") nil)
(global-set-key (kbd "C-q") nil)
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-t") nil)
(global-set-key (kbd "C-j") nil)
(global-set-key (kbd "C-c") nil)
(global-set-key (kbd "C-u") nil)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-w") 'other-window)
(global-set-key (kbd "C-j") 'backward-word)
(global-set-key (kbd "C-u") 'ace-jump-mode)
(global-set-key (kbd "C-q") 'eval-last-sexp)
(global-set-key (kbd "C-l C-j") 'swiper-helm)
(global-set-key (kbd "C-l l") 'eval-last-sexp)
(global-set-key (kbd "C-t") 'scroll-down-command)
(global-set-key (kbd "C-l C-k") 'helm-show-kill-ring)
(global-set-key (kbd "C-c C-m") 'comment-or-uncomment-region)

(require 'elscreen)
(setq elscreen-prefix-key (kbd "C-o"))
(elscreen-start)
(global-set-key (kbd "C-o C-c") 'elscreen-create)

(require 'mykie)
(require 'sequential-command-config)
(sequential-command-setup-keys)
(define-sequential-command setq-home
  beginning-of-line beginning-of-buffer setq-return)
(define-sequential-command setq-home
    end-of-line end-of-buffer setq-return)

(require 'mykie)
(defvar vimlike-f-recent-char nil)
(defvar vimlike-f-recent-func nil)

(defun vimlike-f (char)
  "search to forward char into current line and move point (vim 'f' command)"
  (interactive "cSearch to forward char: ")
  (when (= (char-after (point)) char)
    (forward-char))
  (search-forward (char-to-string char) (point-at-eol) nil 1)
  (backward-char)
  (setq vimlike-f-recent-search-char char
	vimlike-f-recent-search-func 'vimlike-f))

(defun vimlike-F (char)
  "search to forward char into current line and move point. (vim 'F' command)"
  (interactive "cSearch to backward char: ")
  (search-backward (char-to-string char) (point-at-bol) nil 1)
  (setq vimlike-f-recent-search-char char
	vimlike-f-recent-search-func 'vimlike-F))

(mykie:global-set-key "C-l ;"
  :default vimlike-f
  :region kill-region)

(mykie:global-set-key "C-l C-l"
  :default vimlike-F
  :region  copy-region-as-kill)

(require 'smooth-scroll)
(smooth-scroll-mode t)
(setq mac-mouse-wheel-smooth-scroll t)

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

;; (require 'rainbow-delimiters)
;; (require 'cl-lib)
;; (require 'color)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(global-set-key (kbd "C-o C-p") (lambda ()
				  (interactive)
				  (split-window-horizontally)
				  (other-window 1)))
(global-set-key (kbd "C-o C-l") (lambda ()
				  (interactive)
				  (split-window-vertically)
				  (other-window 1)))
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

(global-set-key (kbd "C-o C-u") 'helm-mini)
(global-set-key (kbd "C-o C-i") 'save-buffer)
(global-set-key (kbd "C-o C-o") 'delete-other-windows)
(global-set-key (kbd "C-o C-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "C-x C-i") (lambda ()
				  (interactive)
				  (switch-to-buffer "*scratch*")))
(global-set-key (kbd "C-x C-o") (lambda ()
				  (interactive)
				  (find-file "~/.emacs")))
(global-set-key (kbd "C-x C-x") (lambda ()
				  (interactive)
				  (find-file "~/Helm.org")))

(require 'web-mode)
(require 'php-mode)
(require 'flycheck)
(require 'flycheck-pos-tip)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
