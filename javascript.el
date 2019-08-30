;;; package --- Summary

;;; Commentary:
;;;   This is my javascript setup
;;; Code:
;;;
(message "Loading javascript setup...")
(use-package swagger-mode)
(use-package yaml-mode)
(use-package nvm
  :config (nvm-use (caar (last (nvm--installed-versions))))
  )

(setq js-indent-level 2) ;; set indenting to 2 spaces
(setq js-expr-indent-offset 0)
(setq js-flat-functions t)
(setq js-switch-indent-offset 2)

(use-package js2-mode
  :ensure t
  :init
   (setq js2-bounce-indent-p nil)
   (setq js2-global-externs
         (quote
          ("expect" "describe" "context" "beforeAll" "beforeEach" "afterAll" "afterEach" "jest" "it" "xit")))
   (setq js2-include-browser-externs t)
   (setq js2-include-node-externs t)
   (setq js2-missing-semi-one-line-override t)
   (setq js2-mode-indent-ignore-first-tab t)
   (setq js2-strict-missing-semi-warning nil)
   (setq js2-strict-trailing-comma-warning nil)
  :mode "\\.js\\'"
  :interpreter ("node" . js2-mode)
  :interpreter ("nodejs" . js2-mode)
  :hook
   (hs-minor-mode)
   (js2-refactor-mode)
   )

(use-package js2-refactor
  :ensure t
  :config
  (js2r-add-keybindings-with-prefix "C-c C-m")
  (add-hook 'js2-mode-hook 'js2-refactor-mode)
  )

(message "Set up JS2 mode")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("components\\/.*\\.jsx\\'" . rjsx-mode))


(add-hook 'js2-mode-hook (lambda ()
                           ;; (setq js-indent-level 2)
                           ;; (js2-refactor-mode)
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                           (company-mode)
                           (ac-js2-mode)
                           (js2-imenu-extras-mode))) ;; Better imenu
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'rjsx-mode-hook (lambda ()
                            (js2-refactor-mode)
                            (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                            (company-mode)
                            (ac-js2-mode)
                            (js2-imenu-extras-mode))) ;; Better imenu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'json-mode-hook 'hs-minor-mode)

;; Indium
;; (require 'indium)
;; (add-hook 'rjsx-mode-hook #'indium-interaction-mode)



;; Misc
;; (add-to-list 'auto-mode-alist '("\\*node process\\*" . shell-mode))
;;   :ensure t
;;   :init (global-company-mode)
;;   :custom ((company-backends
;;             (quote 
;;              (
;;               (company-dabbrev-code
;;                company-keywords)  ;; merged backends
;;               company-capf
;;               company-files
;;               )
;;              )
;;             )
;;            (company-auto-complete-p t)
;;            (company-idle-delay 0)
;;            (company-minimum-prefix-length 1)
;;            (company-tooltip-limit 10)
;;            )
;;   :bind (("C-<tab>" . company-complete-common)
;;          ("C-<space>" . company-abort))
;;   )
