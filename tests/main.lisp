(defpackage ltk-tablelist/tests/main
  (:use :cl
        :ltk-tablelist
        :rove))
(in-package :ltk-tablelist/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :ltk-tablelist)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
