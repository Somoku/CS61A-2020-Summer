(define (rle s)
    (define (next ls curr)
        (if (null? ls) nil
            (if (= curr (car ls)) (next (cdr-stream ls) curr) ls)
        )
    )

    (define (helper lst num curr)
        (if (and (not (null? lst)) (= (car lst) curr)) (helper (cdr-stream lst) (+ num 1) curr)
            (list curr num)
        )
    )

    (if (null? s) nil
      (cons-stream (helper s 0 (car s)) (rle (next s (car s))))
    )
)



(define (group-by-nondecreasing s)
    (define (helper curr lst res)
        (if (null? lst) res
            (if (>= (car lst) curr)
                (helper (car lst) (cdr-stream lst) (append res (list (car lst))))
                res
            )
        )
    )

    (define (next lst curr)
        (if (null? lst) nil
            (if (>= (car lst) curr) (next (cdr-stream lst) (car lst)) lst)
        )
    )

    (if (null? s) nil
        (cons-stream (helper (car s) (cdr-stream s) (list (car s))) (group-by-nondecreasing (next s (car s))))
    )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

