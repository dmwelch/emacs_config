;;; package --- Summary

;;; Commentary:
;;;   This is my code folding for all languages
;;; Code:
;;;
;;; -- hideshow --
;; https://writequit.org/articles/working-with-logs-in-emacs.html

(use-package hideshow
  :hook ((prog-mode . hs-minor-mode)
         ;; (5) Hideshow interacts badly with Ediff and `vc-diff'.  At the moment, the
         ;;     suggested workaround is to turn off hideshow entirely, for example:
         (ediff-prepare-buffer-hook . 'turn-off-hideshow))
  ;; :diminish hs-minor-mode  ;; Install diminish package: https://github.com/myrjola/diminish.el
  ;; :init
  ;; (5) Hideshow interacts badly with Ediff and `vc-diff'.  At the moment, the
  ;;     suggested workaround is to turn off hideshow entirely, for example:
  ;; (add-hook 'ediff-prepare-buffer-hook 'turn-off-hideshow)
  :config

  (setq hs-special-modes-alist
        (mapcar 'purecopy
                '((c-mode "{" "}" "/[*/]" nil nil)
                  (c++-mode "{" "}" "/[*/]" nil nil)
                  (java-mode "{" "}" "/[*/]" nil nil)
                  (js2-mode "{" "}" "/[*/]" nil)
                  (rjsx-mode "{" "}" "/[*/]" "<*>*</\*>" nil)
                  (json-mode "{" "}" "/[*/]" nil)
                  )
                )
        )
  ;; Hide the comments too when you do a 'hs-hide-all'
  (setq hs-hide-comments t)
  ;; Remember internal folding when folding higher levels
  (setq hs-allow-nesting t)
  ;; Set whether isearch opens folded comments, code, or both
  ;; where x is code, comments, t (both), or nil (neither)
  (setq hs-isearch-open 'x)

  ;; Some languages (e.g., Java) are deeply nested, so the normal behavior
  ;; of `hs-hide-all' (hiding all but top-level blocks) results in very
  ;; little information shown, which is not very useful.  You can use the
  ;; variable `hs-hide-all-non-comment-function' to implement your idea of
  ;; what is more useful.  For example, the following code shows the next
  ;; nested level in addition to the top-level:
  (defun ttn-hs-hide-level-1 ()
    (hs-hide-level 1)
    (forward-sexp 1))
  (setq hs-hide-all-non-comment-function 'ttn-hs-hide-level-1)

  ;;  HideShow has ‘hs-hide-level’ which hides all code blocks at a specified nesting level but in the example above this would either hide the content of the methods or the content of the function and the complete content of the classes. What is needed is a way to hide blocks that do not contain nested blocks, that is, the leaf nodes. Here is code that provides the function ‘hs-hide-leafs’ which does exactly that:
  (defun hs-hide-leafs-recursive (minp maxp)
      "Hide blocks below point that do not contain further blocks in
    region (MINP MAXP)."
      (when (hs-find-block-beginning)
        (setq minp (1+ (point)))
        (funcall hs-forward-sexp-func 1)
        (setq maxp (1- (point))))
      (unless hs-allow-nesting
        (hs-discard-overlays minp maxp))
      (goto-char minp)
      (let ((leaf t))
        (while (progn
                 (forward-comment (buffer-size))
                 (and (< (point) maxp)
                      (re-search-forward hs-block-start-regexp maxp t)))
          (setq pos (match-beginning hs-block-start-mdata-select))
          (if (hs-hide-leafs-recursive minp maxp)
              (save-excursion
                (goto-char pos)
                (hs-hide-block-at-point t)))
          (setq leaf nil))
        (goto-char maxp)
        leaf))

    (defun hs-hide-leafs ()
      "Hide all blocks in the buffer that do not contain subordinate
    blocks.  The hook `hs-hide-hook' is run; see `run-hooks'."
      (interactive)
      (hs-life-goes-on
       (save-excursion
         (message "Hiding blocks ...")
         (save-excursion
           (goto-char (point-min))
           (hs-hide-leafs-recursive (point-min) (point-max)))
         (message "Hiding blocks ... done"))
       (run-hooks 'hs-hide-hook)))

    :bind (("C-c TAB" . hs-toggle-hiding)
           ("C-\\" . hs-toggle-hiding)
           ("M-+" . hs-show-all)
           ("C-c SPACE" . hs-hide-leafs))  ;; do not use hs-hide-leafs - it doesn't hide at the function/class level

    )

(provide 'config_hideshow)
;; config_hideshow ends here
