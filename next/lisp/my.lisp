(defpackage :next
  (:use :common-lisp :eql)
  (:export
   #:start))

(in-package :next)

(qrequire :webkit)

(defvar *web-view* (qnew "QWebView"))

(defun set-url (name)
  (qlet ((url (qnew "QUrl(QString)" name)))
    (|setUrl| *web-view* url)))

(defun key-pressed (obj event)
  (case (|key| event)
    (#.|Qt.Key_N|
       (set-url "http://www.reddit.com"))
    (#.|Qt.Key_P|
       (set-url "http://www.google.com"))
    (t (return-from key-pressed))))

(defun start ()
  (|show| *web-view*)
  (qadd-event-filter nil |QEvent.KeyPress| 'key-pressed)
  (set-url "http://www.reddit.com/"))