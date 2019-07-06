(defun my-observe ()
  (let* ((current-buf (current-buffer)))
    (save-current-buffer
      (set-buffer (get-buffer-create "julius-emacs.log"))
      (let* ((str (buffer-substring-no-properties (point-min) (point-max))))
        (action current-buf str)
        (erase-buffer)))))

(defun action (buf str)
  (save-current-buffer
    (set-buffer buf)
    (if (string-match "^コピー" str)
        (cool-copy))
    (if (string-match "^貼り付け" str)
        (yank))))

(setq my-observe-timer
      (run-with-idle-timer
       0.5 t 'my-observe))

(cancel-timer my-observe-timer)
