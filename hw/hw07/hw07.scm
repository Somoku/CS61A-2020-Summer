(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cdr (cdr s)))
)


(define (sign num)
  'YOUR-CODE-HERE
  (cond ((< num 0) -1) ((= num 0) 0) (else 1))
)


(define (square x) (* x x))

(define (pow x y)
  'YOUR-CODE-HERE
  (if (= y 0) 1
    (if (even? y) (square (pow x (/ y 2)))
      (* x (square (pow x (/ (- y 1) 2))))))
)


(define (unique s)
  'YOUR-CODE-HERE
  (if (null? s) nil
    (cons (car s) (unique (filter (lambda (x) (not (equal? x (car s)))) (cdr s)))))
)


(define (replicate x n)
  'YOUR-CODE-HERE
  (define (rep_helper x n res)
    (if (= n 0) res
        (rep_helper x (- n 1) (cons x res)))
  )
  (rep_helper x n nil)
)


(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (if (= n 1) (combiner start (term n))
    (combiner (term n) (accumulate combiner start (- n 1) term)))
  
)


(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (helper-tail combiner start n term res)
    (if (= n 0) res
      (helper-tail combiner start (- n 1) term (combiner res (term n))))
  )
  (helper-tail combiner start n term start)
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  'YOUR-CODE-HERE
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
)

