;; See levenshtein.ss for legal information.
;; $Id: test-levenshtein.ss,v 1.1 2009/02/24 19:55:45 neilpair Exp $

#lang scheme/base

(require rackunit
         "levenshtein.rkt")

(module+ test

 (check-equal? (levenshtein "adresse" "address") 2)
 (check-equal? (levenshtein "adresse" "addressee") 2)
 (check-equal? (levenshtein "gambol"  "gumbo") 2)
 (check-equal? (levenshtein "gumbo"   "gambol") 2)
 (check-equal? (levenshtein "gumbo"  "bumble") 3)
 (check-equal? (levenshtein "gumbo"  '#(#\b #\u #\m #\b #\l #\e)) 3)

 (check-equal?
             (levenshtein '#(#\g #\u #\m #\b #\o)
                          '#(#\b #\u #\m #\b #\l #\e))
             3)
 (check-equal?
             (levenshtein '(#\g #\u #\m #\b #\o) '#(#\b #\u #\m #\b #\l #\e))
             3)
 (check-equal?
             (levenshtein '#(#\g #\u #\m #\b #\o) '(#\b #\u #\m #\b #\l #\e))
             3)
 (check-equal?
             (levenshtein '#(#\g #\u #\m #\b #\o) '(#\b #\u #\m #\b #\l #\e))
             3)

 (check-equal? (levenshtein "a"      "abcde") 4)
 (check-equal? (levenshtein "abcde"      "a") 4)

 (check-equal? (levenshtein '#(6 6 6) '(1 2 3 4 5 6))       5)
 (check-equal? (levenshtein '#(6 6 6) '(1 2 3 4 5 6 7))     6)
 (check-equal? (levenshtein '#(6 6 6) '(1 2 3 4 5 6 7 6 6)) 6))
