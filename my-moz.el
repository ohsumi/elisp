
(defun my-moz-browser-reload ()
  (interactive)
  (comint-send-string
   (inferior-moz-process)
   "BrowserReload();"))

(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
(moz-minor-mode t)

(defun moz-send-message (moz-command)
  (comint-send-string
   (inferior-moz-process)
   (concat moz-repl-name ".pushenv('printPrompt', 'inputMode'); "
           moz-repl-name ".setenv('inputMode', 'line'); "
           moz-repl-name ".setenv('printPrompt', false); undefined; "))
  (comint-send-string
   (inferior-moz-process)
   (concat moz-command
           moz-repl-name ".popenv('inputMode', 'printPrompt'); undefined;\n")))

(defun my-moz-scrolldown-1 ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollLineDown');\n")) 

(defun my-moz-scrolldown ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollPageDown');")) 

(defun my-moz-scrollup-1 ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollLineUp');\n")) 

(defun my-moz-scrollup ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollPageUp');")) 

(defun my-moz-top ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollTop');\n"))

(defun my-moz-bottom ()
  (interactive)
  (moz-send-message "goDoCommand('cmd_scrollBottom');\n"))

;; (smartrep-define-key 
;;  global-map "C-l f" '(("n" . moz-scrolldown-1)
;; 		      ("N" . moz-scrolldown)
;; 		      ("p" . moz-scrollup-1)
;; 		      ("P" . moz-scrollup)
;; 		      ("a" . moz-top)
;; 		      ("e" . moz-bottom)))

(provide 'my-moz)
