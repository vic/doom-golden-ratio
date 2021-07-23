;;; golden-ratio-ng.el -- Doom Golden Ration -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Paul Alesius
;;
;; Author: Paul Alesius <https://github.com/paulalesius>
;; Maintainer: Paul Alesius <paul@unnservice.com>
;; Created: July 22, 2021
;; Modified: July 22, 2021
;; Version: 0.0.1
;; Keywords: emacs script
;; Homepage: https://github.com/paulalesius/doom-golden-ratio
;; Package-Requires: ((emacs "24.3"))
;;
;;; Code:
(provide 'doom-golden-ratio)
(require 'evil)
(require 'core-lib)

(defgroup)
(defcustom window-size-ratio
  "The desired size ratio of the active window."
  :group 'golden-ratio
  :type 'float)

(defun golden-ratio-ng-term ()
  "Called on window change."
  (let* ((ratio 1.618)
        (height (window-height))
        (width (window-width))
        (total-height (- (frame-height) 1))
        (total-width (- (frame-width) 1))
        (new-height (truncate (/ total-height ratio)))
        (new-width (truncate (/ total-width ratio))))
    (evil-window-set-height new-height)
    (evil-window-set-width new-width)))

(defun doom-golden-ratio ()
   "Determines first whether it is running in a graphical session."
   ;; Skip when the current window is the root window
   (unless (eq (frame-root-window) (get-buffer-window))
     (unless (display-graphic-p)
       (doom-golden-ratio-term))))

(remove-hook! 'doom-switch-window-hook #'doom-golden-ratio)
(add-hook! 'doom-switch-window-hook #'doom-golden-ratio)
;;; doom-golden-ratio.el ends here
