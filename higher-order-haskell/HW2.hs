-- CptS 355 - Summer 2023 Assignment 2
-- Please include your name and the names of the students with whom you discussed any of the problems in this homework

module HW2
     where

--____________________________________________________________________________________
{- 1-  merge2 & merge2Tail & mergeN - 22% -}
{- The function merge2 takes two lists of integers, l1 and l2, each already in ascending order, and 
returns a merged list that is also in ascending order. The resulting list should include the elements from 
both lists and may include duplicates.  
The type of merge2 should be merge2 :: Ord a => [a] -> [a] -> [a].   -}
--merge2


merge2 :: Ord a => [a] -> [a] -> [a]
merge2 list1 [] = list1 --empty list case
merge2 [] list2 = list2
merge2 (x:xs) (y:ys) | (x <= y) = x : merge2 xs (y:ys) --cons the lesser value and then move the list down one slot
                     | otherwise = y : merge2 (x:xs) ys

{-
Tests
merge2 [] [1,2,4] --> [1,2,4]
merge2 [] [] --> []
-}


{- Re-write the merge2 function from part (a) as a tail-recursive function.  Name your function 
merge2Tail.  
(Hint: In your bases case(s), use revAppend (which we defined in class) to add the reverse of the accumulated 
merged list to the other list.) 
The type of merge2Tail should be merge2Tail :: Ord a => [a] -> [a] -> [a].      -}
--merge2Tail
merge2Tail :: Ord a => [a] -> [a] -> [a]
merge2Tail list1 list2 = merge2Tail_helper list1 list2 []
     where
          revAppend :: [a] -> [a] -> [a] --from lecture slides, cause question hint said to use it
          revAppend [] acc = acc
          revAppend (x:xs) acc = revAppend xs (x:acc)

          merge2Tail_helper [] [] acc = acc --base case at the very end 
          merge2Tail_helper xs [] acc = revAppend acc xs --reverse the list becuase tail recursion
          merge2Tail_helper [] ys acc = revAppend acc ys --same as above
          merge2Tail_helper (x:xs) (y:ys) acc | x <= y = merge2Tail_helper xs (y:ys) (x:acc) --Same as merge2 but i use tail recursion for each func call
                                              | otherwise = merge2Tail_helper (x:xs) ys (y:acc)


{-
Tests
merge2Tail [0] [0] --> [0,0]
merge2Tail [-1,-2] [3,4] --> [-1,-2,3,4]
-}


{- Using your merge2 function defined above and the foldl (or foldr) function, define mergeN, 
which takes a list of lists, each already in ascending order, and returns a new list containing all of the 
elements in sublists in ascending order. Provide an answer using foldl (or foldr); without using 
explicit recursion. 
The type of mergeN should be one of the following: 
mergeN :: (Foldable t, Ord a) => t [a] -> [a]  OR 
mergeN :: Ord a => [[a]] -> [a]         -}
--mergeN

mergeN :: (Foldable t, Ord a) => t [a] -> [a]     --Im using the Foldable signature because then I dont have to worry about the strictness that only having [[]] in the other signature makes me use
--mergeN [[]] = []                                --I don't need a base case, merge2 covers that
mergeN = foldl merge2 []                          --I guess it's that simple since i'm allowed to use my merge2 function from above

{-
Tests
mergeN [[]] --> []
mergeN [[3],[2],[1],[4]] --> [1,2,3,4]
-}




--____________________________________________________________________________________
{- 2 - getInRange & countInRange - 18% 
Define a function getInRange which takes two integer values, v1 and v2,  and a list iL, and returns 
the values in iL which are greater than v1 and less than v2 (exclusive).   Your function shouldn’t need 
a recursion but should use a higher order function (map, foldr/foldl, or filter). You may need 
to define additional helper function(s), which are also not recursive.   
The type of the getInRange function should be:   
getInRange :: Ord a => a -> a -> [a] -> [a]
-}
--getInRange
getInRange :: Ord a => a -> a -> [a] -> [a]
getInRange v1 v2 [] = []
getInRange v1 v2 list = filter (\x -> x > v1 && x < v2) list 
--I use an anonymous function to check the current value of the list to the lower and upper bounds that are passed in and then filter adds it if its true

{-
Tests
getInRange 1 2 [] --> []
getInRange 3 3 [1,2,3,4,5,6] --> []
-}



{-Using getInRange function you defined in part(a) and without using explicit recursion, define a 
function countInRange  which takes two integer values, v1 and v2,  and a nested list iL, and 
returns the total number of values in iL which are greater than v1 and less than v2 (exclusive).  Your 
function shouldn’t need a recursion but should use a higher order function (map, foldr/foldl, or 
filter). You may need to define additional helper function(s), which are also not recursive. You are 
expected to be able to complete this task without simply merging the nested lists into a single list, i.e. do 
not use the functions defined in problem 1. Instead, expect to make multiple uses of map, 
foldr/foldl, and/or filter. 
The type of the countInRange  function should be:   
countInRange :: Ord a => a -> a -> [[a]] -> Int 
-}
--countInRange
countInRange :: Ord a => a -> a -> [[a]] -> Int
countInRange v1 v2 iL = length $ concat $ map (getInRange v1 v2) iL
{-
I solved this problem useing three steps. First I use map to call getInRange to get the numbers that fit in the bounds then I make it all one list with concat then I just return the number of values in that list with length. Below shows my steps of my thought process
c1 v1 v2 iL = map (getInRange v1 v2) iL
          ghci> c1 3 10 [[1,2,3,4],[5,6,7,8,9],[10,11]]
          [[4],[5,6,7,8,9],[]]

c2 v1 v2 iL = concat $ map (getInRange v1 v2) iL
          ghci> c2 3 10 [[1,2,3,4],[5,6,7,8,9],[10,11]]
          [4,5,6,7,8,9]

c3 v1 v2 iL = length $ concat $ map (getInRange v1 v2) iL
          ghci> c3 3 10 [[1,2,3,4],[5,6,7,8,9],[10,11]]
          6

countInRange v1 v2 iL = length $ getInRange v1 v2 $ concat iL --I made this function first but just to be safe I didnt choose to use it becuase it doesn't use a higher order function that the question said I needed to use. It is simpiler though so I thought I would include it. I had fun using the $ operation so I just kept making variations of this questions answer
-}


{-
Tests
countInRange 1 3 [[],[],[]] --> 0
countInRange 1 3 [[],[1],[],[2,-2],[],[3,3,3]] --> 1
-}


--____________________________________________________________________________________
{- 3 -  addLengths & addAllLengths - 18% 
Define a Haskell function addLengths that takes two LengthUnit values  and calculates the sum 
of those in INCH s. (Note that 1 foot = 12 inches  and 1 yard = 36 inches) 
 
The type of the addLengths function should be:   
addLengths :: LengthUnit -> LengthUnit -> LengthUnit 
-}

data LengthUnit =  INCH  Int | FOOT  Int | YARD  Int
                   deriving (Show, Read, Eq)
-- addLengths
addLengths :: LengthUnit -> LengthUnit -> LengthUnit 
addLengths (INCH x) (INCH y) = INCH (x + y)

addLengths (FOOT x) (INCH y) = INCH ((x*12) + y)
addLengths (INCH x) (FOOT y) = INCH (x + (y*12))
addLengths (FOOT x) (FOOT y) = INCH ((x*12) + (y*12))

addLengths (YARD x) (INCH y) = INCH ((x*36) + y)
addLengths (INCH x) (YARD y) = INCH (x + (y*36))
addLengths (YARD x) (FOOT y) = INCH ((x*36) + (y*12))
addLengths (FOOT x) (YARD y) = INCH ((x*12) + (y*36))
addLengths (YARD x) (YARD y) = INCH ((x*36) + (y*36))

--Following the example set by the data MONEY COIN BILL had in the lecture slides I just opted to manually write out each combination. I realize now that I should just have called a function like "convert2inch" in a where clause that just returns the right number and call that for x and y then just add them together. The question does say that I can do it this way though. 


{-
Tests
addlengths (YARD 2) (YARD 1) --> INCH 108
addLengths (FOOT 0) (FOOT 0) --> INCH 0

-}





{-Now, define a Haskell function addAllLengths that takes a nested list of LengthUnit values and calculates the sum of those in inches. Your function shouldn’t need a recursion but should use functions “map” and “foldr (or foldl)”. You may define additional helper functions which are not recursive.   
The type of the addAllLengths function should be one of the following:   
addAllLengths :: Foldable t => [t LengthUnit] -> LengthUnit  OR 
addAllLengths :: [[LengthUnit]] -> LengthUnit

(Hint: The base for fold needs to be a LengthUnit value. )   -}

--addAllLengths :: Foldable t => [t LengthUnit] -> LengthUnit
addAllLengths :: [[LengthUnit]] -> LengthUnit
addAllLengths list = foldl addLengths (INCH 0) (concat list)

--To explain what I'm doing with this function is I have the hint that I should use fold though my first thought for going through a list of list I could just use map twice to get to each element. Foldl has three paramenters so I have the operator being the allLengths function and then a starting accumulator being INCH 0 so if an empty list is passed in it returns INCH 0 then I use the concat function again like I did in #2b which just makes the list of lists into a single list and removes emtpy lists. So foldl goes through each element in the concat list and applies the addLengths function on it then just adds the result to the INCH 0 accumulator then returns that accumulator

{-
Tests
addAllLengths [[],[],[],[],[INCH 1]] --> INCH 1
addAllLengths [[INCH 1], [FOOT 1, FOOT 1], [YARD 1, YARD 1, YARD 1]] --> INCH 133

-}



--____________________________________________________________________________________
{-4 - sumTree and createSumTree - 22%
Write a function sumTree that takes a tree of type Tree Integer and calculates the sum of the 
values stored in the leaves only.  The type of the sumTree function should be:   
sumTree :: Num p => Tree p -> p
-}

data Tree a = LEAF a | NODE a  (Tree a)  (Tree a)
              deriving (Show, Read, Eq)

--sumTree
sumTree :: Num p => Tree p -> p
sumTree (LEAF x) = x
sumTree (NODE x left right) = sumTree left + sumTree right
--As stated in lecture traversing a tree is really easy you just have to recursively go through all left and right nodes and eventually you will reach an end leaf of each path and to calculate the sum you just add the value if it's a leaf type

{-
Tests
This tree looks like           10
                          5           15
                      4      3      8     2
                    7   2               1   9
treeEx1 = NODE 10 (NODE 5 (NODE 4 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 15 (LEAF 8) (NODE 2 (LEAF 1) (LEAF 9)))
sumTree treeEx1  --> 30

This tree looks like       1
                        2     3
                            4   5
                          6  7
treeEx2 = NODE 1 (LEAF 2) (NODE 3 (NODE 4 (LEAF 6) (LEAF 7)) (LEAF 5))
sumTree treeEx2  --> 20
-}


{-Write a function createSumTree takes a Tree Integer value and returns a Tree 
Integer, where the interior nodes store the sum of the leaf values underneath them. See the 
example below. 
The type of the createSumTree function should be  
createSumTree :: Num a => Tree a -> Tree a   -}
--createSumTree
createSumTree :: Num a => Tree a -> Tree a
createSumTree (LEAF x) = LEAF x 
createSumTree (NODE _ left right) = NODE sumVal (createSumTree left) (createSumTree right)
  where
    sumVal = sumTree (createSumTree left) + sumTree (createSumTree right)
--So this is very conceptually difficult for me to understand so ill try my best to explain it. Im traversing the tree as usual again and then when I get to part where Im at a node with one or two leafs below it I call the sumTree function from part A. I use this function to calc the sum esentially for the interior node above it. Before the function sumTree just added up all leaf nodes but what if it is only passed a tree with one node and two leafs. I will get the sum of that section which I use for the interior nodes of my tree im building here. I have that go through all sections of the tree starting at the bottom left and then as far up that side it can go then thed bottom right then slowly all the way to the top.

{-
Tests

t3 = NODE 0 (NODE 0 (NODE 0 (LEAF 4) (LEAF 5)) (LEAF 6)) (NODE 0 (LEAF 8) (LEAF 9)) 
createSumTree t3

This tree looks like       0
                        0     1
                      0   6
                    4   5
treeEx3 = NODE 0 (NODE 0 (NODE 0 (LEAF 4) (LEAF 5)) (LEAF 6)) (LEAF 1) 
createSumTree treeEx3 --> NODE 16 (NODE 15 (NODE 9 (LEAF 4) (LEAF 5)) (LEAF 6)) (LEAF 1)

This tree looks like       0
                        1     2
treeEx4 = NODE 0 (LEAF 1) (LEAF 2) 
createSumTree treeEx4 --> NODE 3 (LEAF 1) (LEAF 2)

This tree looks like           0
                          0           0
                      0      3      8     0
                    7   2               1   9
treeEx5 = NODE 0 (NODE 0 (NODE 0 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 0 (LEAF 8) (NODE 0 (LEAF 1) (LEAF 9)))
sumTree treeEx5  --> NODE 30 (NODE 12 (NODE 9 (LEAF 7) (LEAF 2)) (LEAF 3)) (NODE 18 (LEAF 8) (NODE 10 (LEAF 1) (LEAF 9)))

-}


--____________________________________________________________________________________
{-5 - foldListTree - 20%
Write a function foldListTree that takes a function (f), a base value (base), and a ListTree (t) and combines the values in the lists of the leaf nodes in tree t by applying function f. (The leaves of the tree are scanned from left to right).  
 
foldListTree is invoked as: 
  foldListTree f base t  
 
where f is the combining function of type a -> a -> a. 
 
The type of foldListTree should be: 
foldListTree :: (a -> a -> a) -> a -> ListTree a -> a      -}
data ListTree a = ListLEAF [a] | ListNODE [(ListTree a)]
                  deriving (Show, Read, Eq)

foldListTree :: (a -> a -> a) -> a -> ListTree a -> a
foldListTree f base (ListLEAF t) = foldl f base t
foldListTree f base (ListNODE t) = foldl (\acc subT -> f acc (foldListTree f base subT)) base t

{- 
I realized that when dealing with these tree questions that you can make it a lot more complicated fast. I realized that if you make the function go in either two directions with two lines of code whether its a NODE or a LEAF it becomes a lot easier. My base case is when the current iteration is on a leaf and thats when it uses foldl to apply the function passed in onto the list until the end. The NODE section to a long time to conceptualize. I use foldl on the intial node to go through it entirely. Then every recursive call will spread out to all other existing nodes until leafs are found. Before every recursive call I have an anonymous function that uses a subTree variable and an accumulator to apply the function passed in onto the next call with the subTree variable passed in as a placholder. This updates the accumulator and will eventually crawl all the way up the call stack with the resulting value. 

This was my first iteration of this function I couldn't get this to work so I scrapped it and start over. This problem caused a lot of headache while I was working on it. I was stuck for a long time. Though I think I have a semi decent solution.

foldListTree f base (ListLEAF x) = foldl f base x
foldListTree f base (ListNODE []) = base
foldListTree f base (ListNODE children) = foldr (foldListTree f) base children
-}


{-
Tests


t4 = ListNODE [ ListNODE [ ListLEAF [1,2,3],ListLEAF [4,5],ListNODE([ListLEAF [6], ListLEAF []]) ], ListNODE [], ListLEAF [7,8], ListNODE [ListLEAF [], ListLEAF []] ] 
foldListTree (+) 0 t4  
36 
minValue = toInteger(minBound::Int)  
foldListTree (max) (minValue) t4 
8 



This is what the tree looks like (if word wrap is turned off)
                             [   ]                       [   ]                         [   ]                         [   ]
                            [] []                       []   []                       []   []                       []   [] 
                        [][]     [][]               [][]       [][]               [][]       [][]               [][]       [][] 
                 [1,1,1] [1,1] [1,1] [1,1]      [1,1] [1,1] [1,1] [1,1]       [1,1] [1,1] [1,1] [1,1]       [1,1] [1,1] [2,1] [1,1] 


treeEx6 = ListNODE [ListNODE [ListNODE [ListLEAF [1, 1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]]], ListNODE [ListNODE [ListLEAF [1, 1], ListLEAF [1, 1]], ListNODE [ListLEAF [2, 1], ListLEAF [1, 1]]]]

minValue = toInteger(minBound::Int)  
foldListTree (max) (minValue) treeEx6 --> 2 




  This is what the tree looks like
                         [][]
                        []   []
                      []     [][]
                            [1,2][3,4]
                            
treeEx7 = ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListNODE [ListLEAF [], ListLEAF [1, 2], ListLEAF [3, 4]]]]]

foldListTree (+) 0 treeEx7 --> 10

-}





--____________________________________________________________________________________
{- 6- Create two tree values :  Tree Integer  and  listTree a ;  Both trees should have at least 3 levels. 
Create two tree values: a  “Tree Integer” and a  “ListTree a” (a will be substituted by the type of 
the values stored in the tree). The height of both trees should be at least 3. Test your functions 
sumTree, createSumTree, foldListTree with those trees. The trees you define should be 
different than those that are given.  See the example tests given in the file HW2SampleTests.hs
-}


--t5 = ListNODE [ ListNODE [ ListNODE [ ListLEAF [1, 2, 3], ListLEAF [4, 5] ], ListNODE [ ListLEAF [6, 7], ListLEAF [8, 9] ] ], ListNODE [ ListNODE [ ListLEAF [10, 11], ListLEAF [12, 13] ],ListNODE [ ListLEAF [14, 15], ListLEAF [16, 17] ] ], ListNODE [ ListNODE [ ListLEAF [18, 19], ListLEAF [20, 21] ], ListNODE [ ListLEAF [22, 23], ListLEAF [24, 25] ]]]

--This is a backup tree that I was working on
--I think I have enough test tree of type Tree and ListTREE



--My trees are in the TEST file










































