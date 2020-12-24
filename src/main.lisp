(in-package :ltk-tablelist)

(eval-when (:load-toplevel)
  (setf *init-wish-hook*
        (append *init-wish-hook*
                (list (lambda ()
                        (send-wish "package require tablelist 6.11"))))))

;; tablelist

(defclass tablelist (widget) ())

(defmethod initialize-instance :after ((tl tablelist) &key columns width)
  (format-wish "tablelist::tablelist ~a ~@[ -columns {~{~s ~}}~]~
                                        ~@[ -width ~a ~]"
               (widget-path tl) columns width))

(defgeneric tablelist-insert (tl index &rest items))

(defmethod tablelist-insert ((tl tablelist) index &rest items)
  "Insert items into tl at index. An item is a list of values for a row."
  (mapc (lambda (item)
          (if (listp item)
              (format-wish "~a insert ~a {~{~s ~}}" (widget-path tl) index item)
              (format-wish "~a insert ~a ~s" (widget-path tl) index item)))
        items))

;; scrolled-tablelist

(defun make-scrollbar (master &key (orientation "vertical"))
  (make-instance 'scrollbar :master master :orientation orientation))

(defclass scrolled-tablelist (frame)
  ((tablelist   :accessor tablelist)
   (vscroll     :accessor vscroll)))

(defmethod initialize-instance :after ((stl scrolled-tablelist) &key columns width)
  (setf (tablelist stl) (make-instance 'tablelist :master stl :width width :columns columns))
  (setf (vscroll   stl) (make-scrollbar stl :orientation "vertical"))
  (pack (tablelist stl) :side :left)
  (pack (vscroll   stl) :side :left :fill :y)
  (configure (vscroll   stl) "command" (format nil "~a yview" (widget-path (tablelist stl))))
  (configure (tablelist stl) "yscrollcommand"
             (format nil "~a set" (widget-path (vscroll stl)))))

(defun main ()
  (setf *debug-tk* t)
  (with-ltk ()
    (let* ((f   (make-instance 'frame :width 50))
           (tbl (make-instance 'scrolled-tablelist
                               :master f
                               :width  40
                               :columns '(25 "Name" 15 "Geburtsdatum"))))
      ;; (tablelist-insert tbl "end" '("Ulrich Vollert" "06.01.1957") '("Laura Vollert"  "11.10.2013"))
      (tablelist-insert (tablelist tbl) "end" '("Sabine Vollert" "08.01.1956"))
      (dotimes (i 20)
        (tablelist-insert (tablelist tbl) "end" (list "Freddy" i)))
      (pack f)
      (pack tbl))))
