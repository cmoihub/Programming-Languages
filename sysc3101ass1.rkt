#lang racket
;Craig Isesele 100950074
;open DrRacket and set language of compiler to scheme or racket, if not automatically done
;Type in (compile) and equation in below format
;
;Format: (* x y) or (/(- a b)(+ c d))
(define(compile) (evaluate parser) (newline)
  (compile);feels recursive
  )

;index of register positions
(define count 0)

;since compile does not take any arguments i used this function
(define (evaluate expression) (write(expression(read)))
  (newline) (set! count 0) (evaluate expression);recursive
  )

;return number or ask parser to recursively break up equation
(define (operand expr)
  (cond ((number? expr) expr) (else (parser expr))))

(define (parser input)
  (let((op (car input));operator
       (operand1 (operand (cadr input))) ;first digit after operator
       (operand2 (operand (caddr input))) ;second digit after operator
       )
    
  (cond
    ;Addition case
    ((eq? op '+)
        (move operand1 operand2 count)
        (set! count(+ 2 count));adjust count
       (printf "add register-~a register-~a" (- count 1) count)(newline)
       (+ operand1 operand2))

       ;Subtraction case
      ((eq? op '-)
        (move operand1 operand2 count)
        (set! count(+ 2 count));adjust count
       (printf "minus register-~a register-~a" (- count 1) count)(newline)
       (- operand1 operand2))

      ;Multiplication case
      ((eq? op '*)
        (move operand1 operand2 count)
        (set! count(+ 2 count));adjust count
        (printf "multiply register-~a register-~a" (- count 1) count)(newline)
       (* operand1 operand2))

      ;Division case
      ((eq? op '/)
        (move operand1 operand2 count)
        (set! count(+ 2 count));adjust count
       (printf "divide register-~a register-~a" (- count 1) count)(newline)
       (/ operand1 operand2))
      
      (else (display "use this format: op operand operand
where op is one of -,+,*,/ and operand is a combination of the operators followed by a number,
enclosed in brackets"))
      )))

;show where registers are being moved to
(define (move operand1 operand2 count)
  (set! count (+ 1 count))
  (printf "move ~a register-~a" operand1 count)(newline)
  (set! count (+ 1 count))
  (printf "move ~a register-~a" operand2 count)(newline)
  )