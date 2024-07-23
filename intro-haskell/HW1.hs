-- CptS 355 - Summer 2023 Assignment 1
-- Please include your name and the names of the students with whom you discussed any of the problems in this homework
-- Mitchell Kolb

module HW1
     where

import Data.Char (toUpper)

-- 1. exists
{-which takes a “value” and a “list” as input. If the value is a member 
of the list, the function should return True. Otherwise it should return False.  
The function should have type exists :: Eq t => t -> [t] -> Bool. -}
exists :: Eq t => t -> [t] -> Bool
exists num [] = False                             --This is the base case to return false is I get to the end of the list
exists num (x:xs) | (num == x) = True             --This is the true case to stop recursion if I found the value in the list
                  | otherwise = exists num xs     --The recursive statement that takes the head (x) away and moves the targeted value over one spot over (xs) for the next cycle

{-
b) [2pts] Explain in a comment why the type is  
exists :: Eq t => t -> [t] -> Bool 
          but not  
exists :: t -> [t] -> Bool

So in "t -> [t] -> Bool" what that is basically saying is that the value t and the list with values [t] are taken as inputs and they return a Bool. The above type signiture which included the "Eq t =>" that is making sure that the inputted values are of the equality class and can be compared. This comes in handy because some inputted values can be the same type but we can't compare them. For example functions are a type but can't be compared. This "Eq t =>" makes sure that only values of the same type and can be compared are inputted. 
-}

{-
Tests
exists 'b' ['a', 'b', 'c'] --> True
exists 'z' "Hello" --> False
-}


-- _________________________________________________________________________________________
-- 2. listUnion
{-listUnion that takes two lists as input and returns the union of those lists.  Your function should have type listUnion :: Eq a => [a] -> [a] -> [a].  
Each value should appear in the output list only once, but the order does not matter. Please note that the input lists may have duplicate values or there may be values that appear in both input lists. All such duplicate values should be removed.-}

      
listUnion :: Eq a => [a] -> [a] -> [a] --type signiture
listUnion [] [] = [] --If they are both empty return an empty list
listUnion list1 [] = removeDups list1 --This is Second step that is used at the end to remove the possible duplicates from list1 only after list2 is combined with list1
    where 
          removeDups [] = [] --Base case for recursion
          removeDups (x:xs) | elem x xs = removeDups xs --Removes value if it exists already in the list
                            | otherwise = x : removeDups xs --Attaches the unqiue value
listUnion list1 (x:xs) | elem x list1 == True = listUnion list1 xs --This is the First step to combine only the unqiue values from list2 into list1
                       | otherwise = listUnion (list1 ++ [x]) xs 

{-
Tests
listUnion [] [1] --> [1]
listUnion [2] [] --> [2]
-}


-- _________________________________________________________________________________________
-- 3. replace
{-replace that takes an index n, a value v, and a list L and returns a (new) list which is the same as L, except that its nth element is v. Assume 0-based indexing for n and n≥0. (Note that n can be greater than the length of the list L. )   
The type of replace should be: 
replace :: (Eq t1, Num t1) => t1 -> t2 -> [t2] -> [t2].-}

replace :: (Eq t1, Num t1) => t1 -> t2 -> [t2] -> [t2]
replace _ _ []     = []                                     --this catches the emtpy list case
replace n v (x:xs)  | n == 0    = v : xs                    --every loop we -1 so when n == 0 we just return the xs with the value attached
                    | otherwise = x : replace (n - 1) v xs  --this recursively calls replace to move the list to the right one spot



-- n = index pos    v = value replaced  list = list passed
-- with n I can only use +,-,* and ==,!= I can't use ><
-- n can't be negative, don't worry about bounds 
-- move through the list with x:xs and subtract 1 from n every cycle, return x
-- when n == 0 just return v and xs and cut out x


{-
Tests
replace 0 3 [] --> []
replace 10 'X' ['A', 'B', 'C'] --> "ABC"
-}


-- _________________________________________________________________________________________
-- 4. prereqFor
{-Assume that we store the list of CptS courses and their prerequisites as a list of tuples. The first element 
of each tuple is the course name and the second element is the list of the prerequisites for that course. 
See below for an example. Please note that a course may have an arbitrary number of prerequisites.  -}
prereqsListTest =  
  [ ("CptS122" , ["CptS121"]),  
    ("CptS132" , ["CptS131"]),  
    ("CptS223" , ["CptS122", "MATH216"]),  
    ("CptS233" , ["CptS132", "MATH216"]),  
    ("CptS260" , ["CptS223", "CptS233"]),  
    ("CptS315" , ["CptS223", "CptS233"]),  
    ("CptS317" , ["CptS122", "CptS132", "MATH216"]),  
    ("CptS321" , ["CptS223", "CptS233"]),  
    ("CptS322" , ["CptS223","CptS233"]),  
    ("CptS350" , ["CptS223","CptS233", "CptS317"]),  
    ("CptS355" , ["CptS223"]),  
    ("CptS360" , ["CptS223","CptS260"]), 
    ("CptS370" , ["CptS233","CptS260"]), 
    ("CptS427" , ["CptS223","CptS360", "CptS370", "MATH216", "EE234"]) 
  ]

prereqFor :: Eq t => [(a, [t])] -> t -> [a]
prereqFor [] _ = [] --Base Case
prereqFor ((course, prerequisites) : rest) target --Both guards move down the prereqList by one tuple cycle its just if the target exists in prereq then course is returned in an appended list
                    | ((exists target prerequisites) == True) = [course] ++ prereqFor rest target
                    | otherwise = prereqFor rest target 

{-
---- My thought process going into this problem to try and break it up into smaller chunks ----
Im using a list that is made up of tuples that within each tuple is a string and a list. My job is to go through all tuples in the outer list and return the string of each tuple is the target string exists inside the inner list.
Essentially im doing this:
     ( (course, prerequisite) : rest_of_tuples) ) target 
     If target exists in prerequisite return course 
     Else move to next tuple by calling func again with rest_of_tuples
     Every cycle I return something I need to append it to a growing list of strings
I can use the exists function I made in #1.
     -> exists 1 [1,2,3] 
        True
-}

{-
Tests
prereqFor prereqsList "CptS121" --> ["CptS122"]
prereqFor prereqsList "EE234" --> ["CptS427"]
-}


-- _________________________________________________________________________________________
-- 5. isPalindrome
{-A palindrome is a sentence or phrase that is the same forwards and backwards, ignoring spaces, 
punctuation and other special characters, and upper vs. lower case. In this problem we will consider 
palindromes that include only letters, digits, and spaces but don’t include any punctuation or any special 
characters — for example “a01 02 2010A”, “Yreka Bakery”, and “Doc note I dissent a fast never prevents 
a fatness I diet on cod”. Assume that letters are case insensitive —  for example “Madam Im Adam” 
Write a Haskell function isPalindrome that takes a string as argument and that returns True if the 
string is a palindrome and False otherwise.  
(Note: you can make use of the following Haskell functions:  reverse (for reversing a list), toUpper 
(for retrieving the uppercase of a given character). You can include toUpper from the Data.Char 
module, i.e., include the following line in the beginning of your module:   
import Data.Char (toUpper))-}


isPalindrome :: [Char] -> Bool
isPalindrome [] = True
isPalindrome string = isPalindrome_helper string (reverse string) (length string) --Im just gonna check two strings where one is reversed with a length variable that I subtract from till it reaches 0. 
     where
          isPalindrome_helper [] [] _ = True                   --This catches the empty string case
          isPalindrome_helper (x:xs) (y:ys) len
               | len == 0 = True                              --Once length is == 0 that means that the whole string is traversed and its all matching. Return true.
               | (x == ' ') = isPalindrome_helper xs (y:ys) len --Checks teh whitespace.  Moves to next char if true
               | (y == ' ') = isPalindrome_helper (x:xs) ys len  --Checks the whitespace. Moves to next char if true
               | (toUpper x) == (toUpper y) = isPalindrome_helper xs ys (len - 1)  --This checks the two heads of the strings to see if they match, if they do the length is - 1 and func is called again
               | otherwise = False                            --If the two chars don't match false is returned its one strike youre out 
          --isPalindromeHelper _ _ _ = False                    --This is a catch all to make sure that something is returned no matter what


{-
Tests
isPalindrome ""  --> True
isPalindrome "12  3  21" --> True Checks the whitespace conditions
-}

-- _________________________________________________________________________________________
-- 6. groupSumtoN
{-Write a Haskell function groupSumtoN that takes two arguments, where the first argument is an 
integer (N) and the second is a list (L). The goal is to produce a result in which the elements of the 
original list have been collected into ordered sub-lists each containing maximum number of consecutive 
elements from L summing up to N or less (where N is the integer argument).  The leftover elements (if 
there are any) are included as the last sub-list with a sum less than N.  If an element in the input list L is 
greater than N, that element should be included in its own sublist (including that element only).  
 
The type of groupSumtoN should be:   
groupSumtoN :: (Ord a, Num a) => a -> [a] -> [[a]] 
Note: this function is not required to be tail-recursive. -}


groupSumtoN :: (Ord a, Num a) => a -> [a] -> [[a]]
groupSumtoN _ [] = [[]] --Empty list case returns empty list of lists like in the example tests
groupSumtoN n xs = groupSumtoN_helper n [] xs
  where
    groupSumtoN_helper _ acc [] = [acc] --Base case for recursion this means it reached end of list
    groupSumtoN_helper n acc (x:xs) | x >= n = [x] : groupSumtoN_helper n [] xs --Start new list with element x which would be head of list
                                    | sum (acc ++ [x]) <= n = groupSumtoN_helper n (acc ++ [x]) xs --Add current head element to current list if the accumulator variable plus the head of the list is <= to the set max amount that can be added into the inner list
                                    | otherwise = acc : groupSumtoN_helper n [x] xs --Start new list once the max amount that can be added to the inner list is reached by the next list option


{-
Tests
groupSumtoN 3 []  --> [[]]
groupSumtoN 7 [1,2,3,-1,5]   -->  [[1,2,3,-1],[5]]   tests negative numbers
-}





