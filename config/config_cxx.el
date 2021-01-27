;;; package --- Summary

;;; Commentary:
;;;   This is my C++ setup
;;; Code:
;;;
(message "Loading C++ setup...")

(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)
(add-hook 'c-mode-common-hook 'auto-make-header)

(c-add-style "my-cxx-style"
      ("stroustrup"
       (setq indent-tabs-mode nil)
       (setq c-basic-offset 2)
       (setq c-offsets-alist ((inline-open . 0)  ; custom indentation rules
                              (brace-list-open . 0)
                              (statement-case-open . +)))
       ))

(defun my-cxx-setup-hook ()
  "Set up C/C++/etc."
  (c-set-style "my-cxx-style")
  (auto-fill-mode)
  )

(use-package c++-mode
  :ensure t
  :after cc-mode
  :hook ((
       my-cxx-setup-hook
       auto-make-header
       ))
  :mode "\\.h|\\.cxx|\\.cpp]\\'"
  )


(provide 'config_cxx)
;;; config_cxx.el ends here
