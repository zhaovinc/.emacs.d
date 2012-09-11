;;; ac-source-ispell.el --- Ispell words source for auto-complete-mode

;; Copyright (C) 2010 tequilasunset

;; Author:   tequilasunset <tequilasunset.mac@gmail.com>
;; Keywords: ispell
;; Version:  0.2

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;

;;; Requirements:

;;   auto-complete-mode:
;;
;;     http://cx4a.org/software/auto-complete/
;;

;;; Commentary:

;; Define ac-source-ispell (variable) and ac-complete-ispell (command).

;;; Code:

(require 'auto-complete)
(require 'ispell)

(defconst ac-ispell-cache (make-hash-table :test 'equal))

(defvar ac-ispell-cache-limit 30)

(defun ac-clear-ispell-cache (&optional limit)
  (interactive)
  (let ((table ac-ispell-cache))
    (when (or (not limit)
              (>= (hash-table-count table) limit))
      (clrhash table))))

(defun ac-candidate-ispell-words ()
  (let* ((table ac-ispell-cache)
         (key (downcase (substring ac-prefix 0 3)))
         (cache (gethash key table))
         words)
    (cond
     ((not (string-match "^[a-z]+$" key)) nil)
     (cache cache)
     (t
      (setq words (or (lookup-words (concat key "*") ispell-complete-word-dict)
                      t))
      (puthash key words table)))))

(if (fboundp 'ac-define-source)

    ;; define ac-source-ispell and ac-complete-ispell
    (ac-define-source ispell
      '((init . (ac-clear-ispell-cache ac-ispell-cache-limit))
        (candidates . ac-candidate-ispell-words)
        (symbol . "i")
        (requires . 3)))

  (defvar ac-source-ispell
    '((init . (ac-clear-ispell-cache ac-ispell-cache-limit))
      (candidates . ac-candidate-ispell-words)
      (requires . 3))
    "Source for ispell."))

(provide 'ac-source-ispell)

;;; ac-source-ispell.el ends here