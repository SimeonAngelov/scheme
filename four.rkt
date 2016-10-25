;find if number contains 2
(define (find2 number)
  (cond (( = number 0 ) #f)
      ((= ( remainder number 10) 2) #t)
  (else (find2 (quotient number 10) ) )
  )
)


;given n and x, find P(n,x) = n.x^n + (n-1)x^^(n-1) + .... 1.x^1
(define(poly n x)
  (if (= n 0) 0
      (+ (* n (expt x n))(poly(- n 1) x) ))
 )



;write it in the fast power way
;         (b^(n/2))^2  if n is even ,(even? number) - a funciton in the language (wtf?)
;b^n = {  1 if n = 0
;         b.b^(n-1) if n is odd ,(odd? number) - again a function
(define (expt1 b n)
  (cond  ( (= n 0) 1)
         ((even? n)(expt (expt1 b (/ n 2) ) 2 ) )
         (else (* b (expt1 b (- n 1)))))
  )


;n!/(m! (n-m)!)
(define (fact n)
  (if (= n 0) 1
      (* n (fact (- n 1)))))

(define (comb n m)
  (/ (fact n)(*(fact m)(fact(- n m))))
  )

;figure if a numbers digits are an increasing row
(define (increase? number)
  (define (helper n last)
    (cond ((= n 0) #t)
          ((>= last (remainder n 10))(helper(quotient n 10)(remainder n 10)))
    (else #f)
    )
  )
  (helper (quotient number 10)(remainder number 10))
)

;find number of all even divisors of a number 
(define (evenDiv number)
  (define (helper count divisor)
    (cond ((>= divisor number) count)
           ((= 0 (remainder number divisor)) (helper (+ 1 count) (+ 2 divisor)))
           (else (helper count (+ 2 divisor)))))
(helper 0 2)
)

;1^2 + (1/2)^2 + (1/3)^2 + ... + (1/n)^2

(define (sum-harm-iter n)
  (define (helper sum n)
    (if (= n 0) sum
        (helper (+ sum (expt(/ 1 n) 2)) (- n 1)))
    )
  (helper 0 n))