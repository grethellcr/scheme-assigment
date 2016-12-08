;; -------------------------- QUESTION 2 -------------------------------------
;; Test with (define r (make-ring 5))(display-ring r)(display-ring (cdr r))

;; -------------------------- ANSWER -----------------------------------------
;; Auxiliar procedure to get the last value of a list
(define (last-pair lis)
  (let lp ((lis lis))
    (let ((tail (cdr lis)))
      (if (pair? tail) (lp tail) lis))))

;; Auxiliar procedure to create a list of consecutive numbers. Ex: 3 (3 2 1 0)
(define (iota count)
  (let loop ((n count) (r '()))
    (if (= n -1)
        (reverse r)
        (loop (- n 1)
              (cons n r)))))

;; make-ring
(define (make-ring count)
  (let ((ans (iota count)))
    (set-cdr! (last-pair ans) ans)
    ans))

;; display-ring
(define (display-ring ring)
  (let ((fst (car ring)))
     (define (printer list)
       (if (eq? fst (car list))
           '(...end)
           (cons (car list) (printer (cdr list)))))     
     (cons fst (printer (cdr ring)))))

