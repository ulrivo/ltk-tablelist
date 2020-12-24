(defsystem "ltk-tablelist"
  :version "0.1.0"
  :author "Ulrich Vollert <lisp@ulrivo.de>"
  :license "MIT"
  :depends-on ("ltk")
  :serial nil
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "main" :depends-on ("package")))))
  :description "LTK extension for the TK-widget tablelist"
  :in-order-to ((test-op (test-op "ltk-tablelist/tests"))))

(defsystem "ltk-tablelist/tests"
  :author "Ulrich Vollert <lisp@ulrivo.de>"
  :license "MIT"
  :depends-on ("ltk-tablelist"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for ltk-tablelist"
  :perform (test-op (op c) (symbol-call :rove :run c)))
