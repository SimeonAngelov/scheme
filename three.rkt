#lang racket
;reverse number
(define(reverse n)
  (define (helper number rev)
    (if(< number 10)(+ number (* rev 10))
    (helper (quotient number 10)(+(remainder number 10)(* rev 10)))
    ))
    (helper n 0)
 )


;check number is palindrome
(define (palindrome? number)
  (if(= number (reverse number))#t #f)  
  
 )


;count palindromes in range
(define(count-palindromes start end)
  (define (helper a b count)
    (cond ((> a b )count)
          ((palindrome? a)(helper (+ a 1) b (+ 1 count)))
          (else (helper (+ a 1) b count))
          
     )
  )
  (helper start end 0)  
)

