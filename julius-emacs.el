;;; julius-emacs --- Observe julius result and Take action

;; Copyright (C) 2019- blue0513

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

;; Author: blue0513
;; URL: https://github.com/blue0513/julius-emacs
;; Version: 0.1.0

;;; Commentary:

;; In init.el, you should write
;; (require 'julius-emacs)

;;; Code:

(defvar observable-buffer-name "julius-emacs.log")

(defun julius-emacs-buffer-observe ()
  (let* ((current-buf (current-buffer)))
    (save-current-buffer
      (set-buffer (get-buffer-create observable-buffer-name))
      (let* ((str (buffer-substring-no-properties (point-min) (point-max))))
        (julius-action current-buf str)
        (erase-buffer)))))

(defun julius-action (buf str)
  (save-current-buffer
    (set-buffer buf)
    (if (string-match "^コピー" str)
        (kill-new (thing-at-point 'symbol)))
    (if (string-match "^貼り付け" str)
        (yank))))

(defun start-julius-emacs-buffer-observe ()
  (interactive)
  (setq julius-emacs-buffer-observe-timer
        (run-with-idle-timer 0.5 t 'julius-emacs-buffer-observe)))

(defun stop-julius-emacs-buffer-observe ()
  (interactive)
  (cancel-timer julius-emacs-buffer-observe-timer))

;; * provide

(provide 'julius-emacs)

;;; julius-emacs.el ends here
