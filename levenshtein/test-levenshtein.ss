;; See levenshtein.ss for legal information.
;; $Id: test-levenshtein.ss,v 1.1 2009/02/24 19:55:45 neilpair Exp $

#lang scheme/base

(require (planet neil/testeez:1:1/testeez)
         "levenshtein.ss")

(testeez
 "levenshtein"

 (test/equal "" (levenshtein "adresse" "address") 2)
 (test/equal "" (levenshtein "adresse" "addressee") 2)
 (test/equal "" (levenshtein "gambol"  "gumbo") 2)
 (test/equal "" (levenshtein "gumbo"   "gambol") 2)
 (test/equal "" (levenshtein "gumbo"  "bumble") 3)
 (test/equal "" (levenshtein "gumbo"  '#(#\b #\u #\m #\b #\l #\e)) 3)

 (test/equal ""
             (levenshtein '#(#\g #\u #\m #\b #\o)
                          '#(#\b #\u #\m #\b #\l #\e))
             3)
 (test/equal ""
             (levenshtein '(#\g #\u #\m #\b #\o) '#(#\b #\u #\m #\b #\l #\e))
             3)
 (test/equal ""
             (levenshtein '#(#\g #\u #\m #\b #\o) '(#\b #\u #\m #\b #\l #\e))
             3)
 (test/equal ""
             (levenshtein '#(#\g #\u #\m #\b #\o) '(#\b #\u #\m #\b #\l #\e))
             3)

 (test/equal "" (levenshtein "a"      "abcde") 4)
 (test/equal "" (levenshtein "abcde"      "a") 4)

 (test/equal "" (levenshtein '#(6 6 6) '(1 2 3 4 5 6))       5)
 (test/equal "" (levenshtein '#(6 6 6) '(1 2 3 4 5 6 7))     6)
 (test/equal "" (levenshtein '#(6 6 6) '(1 2 3 4 5 6 7 6 6)) 6))
