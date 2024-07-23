{-Haskell is available for Windows, Mac, and Linux. Here's the download page: http://www.haskell.org/platform/.
We will be using the HUnit unit testing package in CptS 355.

Example of using the HUnit unit test framework.  See  http://hackage.haskell.org/package/HUnit for additional documentation.
To run the tests type "runTestTT tests" at the Haskell prompt.  -}

module HW2SampleTests
    where

import Test.HUnit
import Data.Char
import HW2

{- Two useful functions in the HUnit package are assertEqual and assertBool.
The arguments to 'assertEqual' are:
      a descriptive string
      the expected value
      the value being tested
The arguments to 'assertBool' are:
      a descriptive string
      the boolean value being tested
-}

p1a_test1 = TestCase (assertEqual "merge2 [2,5,6,8,9] [1,3,4,5,7,8,10]" [1,2,3,4,5,5,6,7,8,8,9,10]  (merge2 [2,5,6,8,9] [1,3,4,5,7,8,10]) )

p1b_test1 = TestCase (assertEqual "merge2Tail [2,5,6,8,9] [1,3,4,5,7,8,10]" [1,2,3,4,5,5,6,7,8,8,9,10]  (merge2Tail [2,5,6,8,9] [1,3,4,5,7,8,10]) )

p1c_test1 = TestCase (assertEqual "mergeN [[3,4],[-3,-2,-1],[1,2,5,8,9]]" [-3,-2,-1,1,2,3,4,5,8,9]  (mergeN [[3,4],[-3,-2,-1],[1,2,5,8,9]]) )

p2a_test1 = TestCase (assertEqual "getInRange (-5) 5 [10,5,0,1,2,-5,-10]" [0,1,2]  (getInRange (-5) 5 [10,5,0,1,2,-5,-10]) )
p2a_test2 = TestCase (assertEqual "getInRange (-1) 1 [-2,2,3,4,5]" [] (getInRange (-1) 1 [-2,2,3,4,5]) )

p2b_test1 = TestCase (assertEqual "countInRange 3 10 [[1,2,3,4],[5,6,7,8,9],[10,11]]" 6 (countInRange 3 10 [[1,2,3,4],[5,6,7,8,9],[10,11]]) )
p2b_test2 = TestCase (assertEqual "countInRange (-5) 5 [[-10,-5,-4],[0,4,5],[],[10]]" 3 (countInRange (-5) 5 [[-10,-5,-4],[0,4,5],[],[10]]) )

p3a_test1 = TestCase (assertEqual "addLengths (FOOT 2) (INCH 5)" (INCH 29) (addLengths (FOOT 2) (INCH 5)) )
p3a_test2 = TestCase (assertEqual "addLengths (YARD 3) (INCH (-3))"  (INCH 105) (addLengths (YARD 3) (INCH (-3))) )

p3b_test1 = TestCase (assertEqual "addAllLengths [[YARD 2, FOOT 1], [YARD 1, FOOT 2, INCH 10],[YARD 3]]" (INCH 262) (addAllLengths [[YARD 2, FOOT 1], [YARD 1, FOOT 2, INCH 10],[YARD 3]]) )

p4a_test1 = TestCase (assertEqual ("sumTree "++(show t1)) 32 (sumTree t1) )
t1_output = NODE 32 (NODE 15 (NODE 9 (LEAF 4) (LEAF 5)) (LEAF 6)) (NODE 17 (LEAF 8) (LEAF 9))
p4b_test1 = TestCase (assertEqual ("createSumTree "++ (show t1)) (t1_output) (createSumTree t1) )

p5_test1 = TestCase (assertEqual ("foldListTree (+) 0 "++ (show t4)) 36 (foldListTree (+) 0 t4 ) )
p5_test2 = TestCase (assertEqual ("foldListTree (++) \"\" "++ (show t5)) "School-of-Electrical-Engineering-and-Computer-Science-WSU" (foldListTree (++) "" t5) )


-- Sample Tree Integer examples given in the assignment prompt; make sure to provide your own tree examples for both tree data types
-- Your trees should have minimum 3 levels.
t1 = NODE 1
         (NODE 2 (NODE 3 (LEAF 4) (LEAF 5)) (LEAF 6))
         (NODE 7 (LEAF 8) (LEAF 9))
t2 = NODE 0
          (NODE 0 (LEAF 4) (NODE 0 (LEAF 8) (LEAF 9)))
          (NODE 0 (NODE 0 (LEAF 10) (NODE 0 (LEAF 12) (LEAF 13))) (LEAF 7))

t3 = NODE 0 (NODE 0 (NODE 0 (LEAF 4) (LEAF 5)) (LEAF 6))
                (NODE 0 (LEAF 8) (LEAF 9))

t4 = ListNODE
 [ ListNODE [ ListLEAF [1,2,3],ListLEAF [4,5],ListNODE([ListLEAF [6], ListLEAF []]) ],
   ListNODE [],
   ListLEAF [7,8],
   ListNODE [ListLEAF [], ListLEAF []] ]

l1 = ListLEAF ["School","-","of","-","Electrical"]
l2 = ListLEAF ["-","Engineering","-"]
l3 = ListLEAF ["and","-","Computer","-"]
l4 = ListLEAF ["Science"]
l5 = ListLEAF ["-WSU"]
n1 = ListNODE [l1,l2]
n2 = ListNODE [n1,l3]
t5 = ListNODE [n2,l4,l5]


------------------------------------------------------------------------------------------
--THESE ARE MY TESTS
--I included what my tests are going to be under each function in the HW2.hs file. I made the tests as I wrote the functions


p1a_test1_mk = TestCase (assertEqual "merge2 [] [1,2,4]" [1,2,4]  (merge2 [] [1,2,4]) )
p1a_test2_mk = TestCase (assertEqual "merge2 [] [1]" [1]  (merge2 [] [1]) )
{-
Tests
merge2 [] [1,2,4] --> [1,2,4]
merge2 [] [1] --> [1]
-}



p1b_test1_mk = TestCase (assertEqual "merge2Tail [0] [0]" [0,0]  (merge2Tail [0] [0]) )
p1b_test2_mk = TestCase (assertEqual "merge2Tail [-1,-2] [3,4]" [-1,-2,3,4]  (merge2Tail [-1,-2] [3,4]) )

{-
Tests
merge2Tail [0] [0] --> [0,0]
merge2Tail [-1,-2] [3,4] --> [-1,-2,3,4]
-}




p1c_test1_mk = TestCase (assertEqual "mergeN [[1]]" [1]  (mergeN [[1]]) )
p1c_test2_mk = TestCase (assertEqual "mergeN [[3],[2],[1],[4]]" [1,2,3,4]  (mergeN [[3],[2],[1],[4]]) )

{-
Tests
mergeN [[1]] --> [1]
mergeN [[3],[2],[1],[4]] --> [1,2,3,4]
-}



p2a_test1_mk = TestCase (assertEqual "getInRange 1 2 []" [] (getInRange 1 2 []) )
p2a_test2_mk = TestCase (assertEqual "getInRange 3 3 [1,2,3,4,5,6]" [] (getInRange 3 3 [1,2,3,4,5,6]) )

{-
Tests
getInRange 1 2 [] --> []
getInRange 3 3 [1,2,3,4,5,6] --> []
-}




p2b_test1_mk = TestCase (assertEqual "countInRange 1 3 [[],[],[]]" 0 (countInRange 1 3 [[],[],[]]) )
p2b_test2_mk = TestCase (assertEqual "countInRange 1 3 [[],[1],[],[2,-2],[],[3,3,3]]" 1 (countInRange 1 3 [[],[1],[],[2,-2],[],[3,3,3]]) )

{-
Tests
countInRange 1 3 [[],[],[]] --> 0
countInRange 1 3 [[],[1],[],[2,-2],[],[3,3,3]] --> 1
-}



p3a_test1_mk = TestCase (assertEqual "addLengths (YARD 2) (YARD 1)" (INCH 108) (addLengths (YARD 2) (YARD 1)) )
p3a_test2_mk = TestCase (assertEqual "addLengths (FOOT 0) (FOOT 0)" (INCH 0) (addLengths (FOOT 0) (FOOT 0)) )
{-
Tests
addlengths (YARD 2) (YARD 1) --> INCH 108
addLengths (FOOT 0) (FOOT 0) --> INCH 0
-}




p3b_test1_mk = TestCase (assertEqual "addAllLengths [[],[],[],[],[INCH 1]]" (INCH 1) (addAllLengths [[],[],[],[],[INCH 1]]) )
p3b_test2_mk = TestCase (assertEqual "addAllLengths [[INCH 1], [FOOT 1, FOOT 1], [YARD 1, YARD 1, YARD 1]]" (INCH 133) (addAllLengths [[INCH 1], [FOOT 1, FOOT 1], [YARD 1, YARD 1, YARD 1]]) )
{-
Tests
addAllLengths [[],[],[],[],[INCH 1]] --> INCH 1
addAllLengths [[INCH 1], [FOOT 1, FOOT 1], [YARD 1, YARD 1, YARD 1]] --> INCH 133
-}





treeEx1 = NODE 10 (NODE 5 (NODE 4 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 15 (LEAF 8) (NODE 2 (LEAF 1) (LEAF 9)))
p4a_test1_mk = TestCase (assertEqual ("sumTree "++(show treeEx1)) 30 (sumTree treeEx1) )

treeEx2 = NODE 1 (LEAF 2) (NODE 3 (NODE 4 (LEAF 6) (LEAF 7)) (LEAF 5))
p4a_test2_mk = TestCase (assertEqual ("sumTree "++(show treeEx2)) 20 (sumTree treeEx2) )
{-
Tests
treeEx1 = NODE 10 (NODE 5 (NODE 4 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 15 (LEAF 8) (NODE 2 (LEAF 1) (LEAF 9)))
sumTree treeEx1  --> 30
treeEx2 = NODE 1 (LEAF 2) (NODE 3 (NODE 4 (LEAF 6) (LEAF 7)) (LEAF 5))
sumTree treeEx2  --> 20
-}






treeEx3 = NODE 0 (NODE 0 (NODE 0 (LEAF 4) (LEAF 5)) (LEAF 6)) (LEAF 1) 
treeEx3_output = NODE 16 (NODE 15 (NODE 9 (LEAF 4) (LEAF 5)) (LEAF 6)) (LEAF 1)
p4b_test1_mk = TestCase (assertEqual ("createSumTree "++ (show treeEx3)) (treeEx3_output) (createSumTree treeEx3) )

treeEx4 = NODE 0 (LEAF 1) (LEAF 2) 
treeEx4_output = NODE 3 (LEAF 1) (LEAF 2)
p4b_test2_mk = TestCase (assertEqual ("createSumTree "++ (show treeEx4)) (treeEx4_output) (createSumTree treeEx4) )

treeEx5 = NODE 0 (NODE 0 (NODE 0 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 0 (LEAF 8) (NODE 0 (LEAF 1) (LEAF 9)))
treeEx5_output = NODE 30 (NODE 12 (NODE 9 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 18 (LEAF 8) (NODE 10 (LEAF 1) (LEAF 9)))
p4b_test3_mk = TestCase (assertEqual ("createSumTree "++ (show treeEx5)) (treeEx5_output) (createSumTree treeEx5) )

{-
Tests
treeEx3 = NODE 0 (NODE 0 (NODE 0 (LEAF 4) (LEAF 5)) (LEAF 6)) (LEAF 1) 
createSumTree treeEx3 --> NODE 16 (NODE 15 (NODE 9 (LEAF 4) (LEAF 5)) (LEAF 6)) (LEAF 1)

treeEx4 = NODE 0 (LEAF 1) (LEAF 2) 
createSumTree treeEx4 --> NODE 3 (LEAF 1) (LEAF 2)

treeEx5 = NODE 0 (NODE 0 (NODE 0 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 0 (LEAF 8) (NODE 0 (LEAF 1) (LEAF 9)))
sumTree treeEx5  --> NODE 30 (NODE 12 (NODE 9 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 18 (LEAF 8) (NODE 10 (LEAF 1) (LEAF 9)))

-}







treeEx6 = ListNODE [ListNODE [ListNODE [ListLEAF [1, 1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [2, 1], ListLEAF [1, 1]]]]
minValue = toInteger(minBound::Int)  
p5_test1_mk = TestCase (assertEqual ("foldListTree (max) (minValue) "++ (show treeEx6)) 2 (foldListTree (max) (minValue) treeEx6 ) )


treeEx7 = ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListLEAF [1, 2], ListLEAF [3, 4]]]]]
p5_test2_mk = TestCase (assertEqual ("foldListTree (+) 0 "++ (show treeEx7)) 10 (foldListTree (+) 0 treeEx7 ) )

treeEx8 = ListNODE [ ListNODE [ ListNODE [ ListLEAF [1, 2, 3], ListLEAF [4, 5] ], ListNODE [ ListLEAF [6, 7], ListLEAF [8, 9] ] ], ListNODE [ ListNODE [ ListLEAF [10, 11], ListLEAF [12, 13] ],ListNODE [ ListLEAF [14, 15], ListLEAF [16, 17] ] ], ListNODE [ ListNODE [ ListLEAF [18, 19], ListLEAF [20, 21] ], ListNODE [ ListLEAF [22, 23], ListLEAF [24, 25] ]]]
p5_test3_mk = TestCase (assertEqual ("foldListTree (+) 1 "++ (show treeEx8)) 347 (foldListTree (+) 1 treeEx8 ) )

{-
Tests

treeEx6 = ListNODE [ListNODE [ListNODE [ListLEAF [1, 1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [2, 1], ListLEAF [1, 1]]]]

minValue = toInteger(minBound::Int)  
foldListTree (max) (minValue) treeEx6 --> 2 

treeEx7 = ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListLEAF [1, 2], ListLEAF [3, 4]]]]]

foldListTree (+) 0 treeEx7 --> 10

-}


------------------------------------------------------------------------------------------


tests = TestList [ TestLabel "Problem 1a - test1 " p1a_test1,
                   TestLabel "Problem 1b - test1 " p1b_test1,
                   TestLabel "Problem 1c - test1 " p1c_test1,
                   TestLabel "Problem 2a - test1 " p2a_test1,
                   TestLabel "Problem 2a - test2 " p2a_test2,
                   TestLabel "Problem 2b - test1 " p2b_test1,
                   TestLabel "Problem 2b - test2 " p2b_test2,
                   TestLabel "Problem 3a - test1 " p3a_test1,
                   TestLabel "Problem 3a - test2 " p3a_test2,
                   TestLabel "Problem 3b - test1 " p3b_test1,
                   TestLabel "Problem 4a - test1 " p4a_test1,
                   TestLabel "Problem 4b - test1 " p4b_test1,
                   TestLabel "Problem 5 - test1 " p5_test1,
                   TestLabel "Problem 5 - test2 " p5_test2,

                   TestLabel "MK-Problem 1a - test1 " p1a_test1_mk,
                   TestLabel "MK-Problem 1a - test2 " p1a_test2_mk,
                   TestLabel "MK-Problem 1b - test1 " p1b_test1_mk,
                   TestLabel "MK-Problem 1b - test2 " p1b_test2_mk,
                   TestLabel "MK-Problem 1c - test1 " p1c_test1_mk,
                   TestLabel "MK-Problem 1c - test2 " p1c_test2_mk,
                   TestLabel "MK-Problem 2a - test1 " p2a_test1_mk,
                   TestLabel "MK-Problem 2a - test2 " p2a_test2_mk,
                   TestLabel "MK-Problem 2b - test1 " p2b_test1_mk,
                   TestLabel "MK-Problem 2b - test2 " p2b_test2_mk,
                   TestLabel "MK-Problem 3a - test1 " p3a_test1_mk,
                   TestLabel "MK-Problem 3a - test2 " p3a_test2_mk,
                   TestLabel "MK-Problem 3b - test1 " p3b_test1_mk,
                   TestLabel "MK-Problem 3b - test2 " p3b_test2_mk,
                   TestLabel "MK-Problem 4a - test1 " p4a_test1_mk,
                   TestLabel "MK-Problem 4a - test2 " p4a_test2_mk,
                   TestLabel "MK-Problem 4b - test1 " p4b_test1_mk,
                   TestLabel "MK-Problem 4b - test2 " p4b_test2_mk,
                   TestLabel "MK-Problem 4b - test3 " p4b_test3_mk,
                   TestLabel "MK-Problem 5 - test1 " p5_test1_mk,
                   TestLabel "MK-Problem 5 - test2 " p5_test2_mk,
                   TestLabel "MK-Problem 5 - test3 " p5_test3_mk
                   
                 ]


-- shortcut to run the tests
run = runTestTT  tests
