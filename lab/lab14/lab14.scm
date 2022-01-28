(define (split-at lst n)
  (define (helper head tail n)
	(if (null? tail) (cons head nil) 
		(if (= n 0) (cons head tail)
			(helper (append head (list (car tail))) (cdr tail) (- n 1))
		)
  	)
  )
  (helper nil lst n)
)


(define-macro (switch expr cases)
	 (cons 'cond 
	   (map (lambda (case) (cons (list 'eq? expr (car case)) (cdr case))) 
    			cases))
)

