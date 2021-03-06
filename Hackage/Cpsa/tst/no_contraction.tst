(comment "CPSA 2.1.0")
(comment "All input read")

(defprotocol no-contraction basic
  (defrole init
    (vars (a b name) (n text))
    (trace (send (enc (enc n (privk a)) (pubk b)))))
  (defrole resp
    (vars (a name) (n text))
    (trace (recv (enc n (privk a))))))

(defskeleton no-contraction
  (vars (n text) (a a-0 b name))
  (defstrand resp 1 (n n) (a a))
  (defstrand init 1 (n n) (a a-0) (b b))
  (non-orig (privk a))
  (uniq-orig n)
  (traces ((recv (enc n (privk a))))
    ((send (enc (enc n (privk a-0)) (pubk b)))))
  (label 0)
  (unrealized (0 0)))

(defskeleton no-contraction
  (vars (n text) (a a-0 b name))
  (defstrand resp 1 (n n) (a a))
  (defstrand init 1 (n n) (a a-0) (b b))
  (precedes ((1 0) (0 0)))
  (non-orig (privk a))
  (uniq-orig n)
  (traces ((recv (enc n (privk a))))
    ((send (enc (enc n (privk a-0)) (pubk b)))))
  (label 1)
  (parent 0)
  (unrealized (0 0))
  (comment "1 in cohort - 1 not yet seen"))

(defskeleton no-contraction
  (vars (n text) (a b name))
  (defstrand resp 1 (n n) (a a))
  (defstrand init 1 (n n) (a a) (b b))
  (precedes ((1 0) (0 0)))
  (non-orig (privk a))
  (uniq-orig n)
  (operation encryption-test (added-strand init 1) (enc n (privk a))
    (0 0))
  (traces ((recv (enc n (privk a))))
    ((send (enc (enc n (privk a)) (pubk b)))))
  (label 2)
  (parent 1)
  (unrealized)
  (shape))

(comment "Nothing left to do")
