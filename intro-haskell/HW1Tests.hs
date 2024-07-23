{-Haskell is available for Windows, Mac, and Linux. Here's the download page: http://www.haskell.org/platform/.

We will be using the HUnit unit testing package in CptS 355.
To setup HUnit:
1. First install call-stack
    - download the package from here: http://hackage.haskell.org/package/call-stack. Download the call-stack-0.2.0.tar.gz file and extract it.
    (To extract .gz and .tar files on Windows you may use 7zip (https://www.7-zip.org/))
    (To extract .gz and .tar files on Linux or Mac you may use gunzip and tar)
    - Then switch to the HUnit directory and install HUnit using the following commands at the terminal/command prompt:
            runhaskell Setup configure
            runhaskell Setup build
            runhaskell Setup install
    If you get "permission denied" errors,
        - on Windows  run the terminal or command line as administrator.
        - on Mac and Linux: run the command in 'sudo' mode (or login as root).

2. Next install HUnit:
   - download the package from here: http://hackage.haskell.org/package/HUnit. Download the HUnit-1.2.5.2.tar.gz file and extract it.
   - Then switch to the HUnit directory and install HUnit using the following commands at the terminal/command prompt:
            runhaskell Setup configure
            runhaskell Setup build
            runhaskell Setup install

            On a unix system or Mac, you may may need to be root for that last part.-}


{- Example of using the HUnit unit test framework.  See  http://hackage.haskell.org/package/HUnit for additional documentation.
To run the tests type "runTestTT tests" at the Haskell prompt.  -}

module HW1Tests
    where

import Test.HUnit
import Data.Char
import Data.List (sort)
import HW1

{- Two useful functions in the HUnit package are assertEqual and assertBool.
The arguments to 'assertEqual' are:
      a descriptive string
      the expected value
      the value being tested
The arguments to 'assertBool' are:
      a descriptive string
      the boolean value being tested
-}

-- test1, test2, and test3 succeed

prereqsList = [("Cpts122" , ["CptS121"]), ("CptS132" , ["CptS131"]), ("CptS223" , ["CptS122", "MATH216"]), ("CptS233" , ["CptS132", "MATH216"]),
                   ("CptS260" , ["CptS223", "CptS233"]), ("CptS315" , ["CptS223", "CptS233"]), ("CptS317" , ["CptS122", "CptS132", "MATH216"]),
                   ("CptS321" , ["CptS223", "CptS233"]), ("CptS322" , ["CptS223","CptS233"]), ("CptS350" , ["CptS223","CptS233", "CptS317"]),
                   ("CptS355" , ["CptS223"]), ("CptS360" , ["CptS223","CptS260"]),("CptS370" , ["CptS233","CptS260"]),
                   ("CptS427" , ["CptS223","CptS360", "CptS370", "MATH216", "EE234"])
                  ]


p1_test1 = TestCase (assertEqual "(exists [1] [[3] [5]])" False  (exists [1] [[3],[5]]) )
p1_test2 = TestCase (assertBool "exists 1 [1,2,3]"  (exists 1 [1,2,3]) )
p1_test3 = TestCase (assertBool "exists '3' \"CptS355\"" (exists '3' "CptS355"))
p1_test4 = TestCase (assertEqual "exists '4' \"CptS355\"" False (exists '4' "CptS355"))

p2_test1 = TestCase (assertEqual "listUnion [1,3,4] [2,3,4,5]"  (sort [1,2,3,4,5])  (sort (listUnion [1,3,4] [2,3,4,5])) )
p2_test2 = TestCase (assertEqual "listUnion \"CptS355\" \"cpts322\""  (sort ("CptS35cs2"))  (sort (listUnion "CptS355" "cpts322" )) )
p2_test3 = TestCase (assertEqual "listUnion [[1,2],[2,3]] [[1],[2,3],[2,3]]"  (sort [[1,2],[1],[2,3]])  (sort (listUnion [[1,2],[2,3]] [[1],[2,3],[2,3]] ) ) )

p3_test1 = TestCase (assertEqual "replace 3 40 [1, 2, 3, 4, 5, 6]" [1,2,3,40,5,6] (replace 3 40 [1, 2, 3, 4, 5, 6]) )
p3_test2 = TestCase (assertEqual "replace 0 'X' \"abcd\""  "Xbcd" (replace 0 'X' "abcd") )
p3_test3 = TestCase (assertEqual "replace 5 6 [1,2,3,4,5]" [1,2,3,4,5] (replace 5 6 [1,2,3,4,5]))

p4_test1 = TestCase (assertEqual "prereqFor prereqsList \"CptS260\"" (sort ["CptS360","CptS370"])  (sort (prereqFor prereqsList "CptS260")) )
p4_test2 = TestCase (assertEqual "prereqFor prereqsList \"CptS223\"" (sort ["CptS260","CptS315","CptS321","CptS322","CptS350","CptS355","CptS360",
            "CptS427"])  (sort (prereqFor prereqsList "CptS223")) )
p4_test3 = TestCase (assertEqual "prereqFor prereqsList \"CptS355\"" ([])  (sort (prereqFor prereqsList "CptS355")) )


p5_test1 = TestCase (assertBool "isPalindrome \"a01 02 2010A\"" (isPalindrome "a01 02 2010A"))
p5_test2 = TestCase (assertBool "isPalindrome \"Doc note I dissent a fast never prevents a fatness I diet on cod\"" (isPalindrome "Doc note I dissent a fast never prevents a fatness I diet on cod"))
p5_test3 = TestCase (assertBool "isPalindrome \"Yreka Bakery\"" (isPalindrome "Yreka Bakery"))

p6_test1 = TestCase (assertEqual "groupSumtoN 15 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]" [[1,2,3,4,5],[6,7],[8],[9],[10]] (groupSumtoN 15 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) )
p6_test2 = TestCase (assertEqual "groupSumtoN 11 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]" [[1,2,3,4],[5,6],[7],[8],[9],[10]] (groupSumtoN 11 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) )
p6_test3 = TestCase (assertEqual "groupSumtoN 55 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]" [[1,2,3,4,5,6,7,8,9,10]] (groupSumtoN 55 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) )

------------------------------------------------------------------------------------------
--THESE ARE MY TESTS
--I included what my tests are going to be under each function in the HW1.hs file. I made the tests as I wrote the functions

mk_p1_test1 = TestCase (assertEqual "exists 'b' ['a', 'b', 'c']" True  (exists 'b' ['a', 'b', 'c']) )
mk_p1_test2 = TestCase (assertEqual "exists 'z' \"Hello\"" False  (exists 'z' "Hello"))

{-
Tests
exists 'b' ['a', 'b', 'c'] --> True
exists 'z' "Hello" --> False
-}

mk_p2_test1 = TestCase (assertEqual "listUnion [] [1]"  [1]  (listUnion [] [1]) )
mk_p2_test2 = TestCase (assertEqual "listUnion [2] []"  [2]  (listUnion [2] []) )
{-
Tests
listUnion [] [1] --> [1]
listUnion [2] [] --> [2]
-}

mk_p3_test1 = TestCase (assertEqual "replace 0 3 []" [] (replace 0 3 []) )
mk_p3_test2 = TestCase (assertEqual "replace 10 'X' ['A', 'B', 'C']" "ABC" (replace 10 'X' ['A', 'B', 'C']) )
{-
Tests
replace 0 3 [] --> []
replace 10 'X' ['A', 'B', 'C'] --> "ABC"
-}

mk_p4_test1 = TestCase (assertEqual "prereqFor prereqsList \"CptS121\"" (sort ["Cpts122"])  (sort (prereqFor prereqsList "CptS121")) )
mk_p4_test2 = TestCase (assertEqual "prereqFor prereqsList \"EE234\"" (sort ["CptS427"])  (sort (prereqFor prereqsList "EE234")) )
{-
Tests
prereqFor prereqsList "CptS121" --> ["Cpts122"]
prereqFor prereqsList "EE234" --> ["CptS427"]
-}

mk_p5_test1 = TestCase (assertBool "isPalindrome \"\"" (isPalindrome ""))
mk_p5_test2 = TestCase (assertBool "isPalindrome \"12  3  21\"" (isPalindrome "12  3  21"))
{-
Tests
isPalindrome ""  --> True
isPalindrome "12  3  21" --> True Checks the whitespace conditions
-}

mk_p6_test1 = TestCase (assertEqual "groupSumtoN 3 []" [[]] (groupSumtoN 3 []) )
mk_p6_test2 = TestCase (assertEqual "groupSumtoN 17 [1,2,3,-1,5]" [[1,2,3,-1],[5]] (groupSumtoN 7 [1,2,3,-1,5]) )
{-
Tests
groupSumtoN 3 []  --> [[]]
groupSumtoN 7 [1,2,3,-1,5]   -->  [[1,2,3,-1],[5]]   tests negative numbers
-}

------------------------------------------------------------------------------------------


tests = TestList [ TestLabel "Problem 1- test1 " p1_test1,
                   TestLabel "Problem 1- test2 " p1_test2,
                   TestLabel "Problem 1- test3 " p1_test3,
                   TestLabel "Problem 1- test4 " p1_test4,
                   TestLabel "Problem 2- test1 " p2_test1,
                   TestLabel "Problem 2- test2 " p2_test2,
                   TestLabel "Problem 2- test3 " p2_test3,
                   TestLabel "Problem 3- test1 " p3_test1,
                   TestLabel "Problem 3- test2 " p3_test2,
                   TestLabel "Problem 3- test3 " p3_test3,
                   TestLabel "Problem 4- test1 " p4_test1,
                   TestLabel "Problem 4- test2 " p4_test2,
                   TestLabel "Problem 4- test3 " p4_test3,
                   TestLabel "Problem 5- test1 " p5_test1,
                   TestLabel "Problem 5- test2 " p5_test2,
                   TestLabel "Problem 5- test3 " p5_test3,
                   TestLabel "Problem 6- test1 " p6_test1,
                   TestLabel "Problem 6- test2 " p6_test2,
                   TestLabel "Problem 6- test3 " p6_test3,

                   TestLabel "MK P1 T1" mk_p1_test1,
                   TestLabel "MK P1 T2" mk_p1_test2,
                   TestLabel "MK P2 T1" mk_p2_test1,
                   TestLabel "MK P2 T2" mk_p2_test2,
                   TestLabel "MK P3 T1" mk_p3_test1,
                   TestLabel "MK P3 T2" mk_p3_test2,
                   TestLabel "MK P4 T1" mk_p4_test1,
                   TestLabel "MK P4 T2" mk_p4_test2,
                   TestLabel "MK P5 T1" mk_p5_test1,
                   TestLabel "MK P5 T2" mk_p5_test2,
                   TestLabel "MK P6 T1" mk_p6_test1,
                   TestLabel "MK P6 T2" mk_p6_test2
                 ]


                 -- shortcut to run the tests
run = runTestTT  tests
