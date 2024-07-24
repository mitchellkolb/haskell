
<h1 align="center">Haskell</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/mitchellkolb/haskell?color=5D4F85">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/mitchellkolb/haskell?color=5D4F85">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/mitchellkolb/haskell?color=5D4F85">

  <img alt="Github stars" src="https://img.shields.io/github/stars/mitchellkolb/haskell?color=5D4F85" />
</p>

<p align="center">
<img
    src="https://img.shields.io/badge/haskell-5D4F85?style=for-the-badge&logo=haskell&logoColor=white"
    alt="Website Badge" />
<img
    src="https://img.shields.io/badge/ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white"
    alt="Website Badge" />
</p>

While learning about how to use haskell I coded a series of functions to solve specific programming problems. The goal was to enhance skills in functional programming, tail-recursion, and higher-order functions. The tasks included writing functions for list operations, tree manipulation, and custom data types, along with full unit tests to ensure correctness. 

![project image](resources/image1.png)

<details>
<summary style="color:#5087dd">Watch the Full Video Demo Here</summary>

[![Full Video Demo Here](https://img.youtube.com/vi/VidKEY/0.jpg)](https://www.youtube.com/watch?v=VidKEY)

</details>

---


# Table of Contents
- [What I Learned](#what-i-learned-in-this-project)
- [Tools Used / Development Environment](#tools-used--development-environment)
- [Team / Contributors / Teachers](#team--contributors--teachers)
- [How to Set Up](#how-to-set-up)
- [Project Overview](#project-overview)
- [Project Details](#project-details)
- [Introduction](#introduction)
- [Key Haskell Concepts](#key-haskell-concepts)
- [HW1](#hw1)
- [HW2](#hw2)
- [Unit Tests](#unit-tests)
- [Topics and Lessons Covered](#topics-and-lessons-covered)
- [Acknowledgments](#acknowledgments)

---

# What I Learned in this Project
- How to
- Programming in 




# Tools Used / Development Environment
- Java
- VS Code
- Terminal
- Ubuntu





# Team / Contributors / Teachers
- [Mitchell Kolb](https://github.com/mitchellkolb)
- Associate Professor. Jeremy E. Thompson






# How to Set Up
This project was implemented on our local machine inside of a virtual machine using:
- Ubuntu Version 20.04.03 found at this [link](http://lt.releases.ubuntu.com/20.04.3/).
- Clone this repository 
- Open terminal at the codebase `~.../ext2/Noah-Mitchell/`




# Project Overview
I utilized Haskell to solve various programming problems aimed at enhancing my skills in functional programming, recursion, and higher-order functions. Through this project, I wrote functions for list operations, tree manipulation, and custom data types, along with comprehensive unit tests to ensure correctness. Key accomplishments include implementing recursive and tail-recursive solutions, effectively using higher-order functions, and ensuring compliance with Haskell's type and style requirements.

## Project Details
This project is structured around solving a series of problems using Haskell, divided into two main assignments and additional topics covered in lectures. The solutions focus on applying functional programming principles to real-world scenarios, emphasizing the power of recursion and higher-order functions.

## Introduction
In this project, I applied the principles of functional programming in Haskell to solve a variety of problems. The tasks included operations on lists, trees, and custom data types. Through these tasks, I aimed to deepen my understanding of recursion, higher-order functions, type systems, and other key concepts in Haskell such as currying, data types, and tail-recursion.

## Key Haskell Concepts

- **Currying**: Currying is a technique where a function with multiple arguments is transformed into a sequence of functions, each with a single argument. This allows for partial application of functions, making Haskell code more flexible and reusable.

- **Higher-Order Functions**: Higher-order functions are functions that take other functions as arguments or return functions as results. Some common higher-order functions in Haskell include:
  - `map`: Applies a function to each element of a list.
  - `filter`: Selects elements of a list that satisfy a predicate.
  - `foldr` and `foldl`: Reduce a list to a single value by recursively applying a function.

- **Data Types**: Haskell's type system is strong and statically typed, which helps catch many errors at compile time. You can define your own data types using the `data` keyword.

- **Tail-Recursion**: Tail-recursion is a special form of recursion where the recursive call is the last operation in the function. This allows the compiler to optimize the recursion, making it as efficient as a loop.

## HW1
In this project, I applied Haskell to solve problems such as:
1. **exists**: A function to check if a value exists in a list.
2. **listUnion**: A function to return the union of two lists.
3. **replace**: A function to replace an element at a given index in a list.
4. **prereqFor**: A function to find all courses that require a given course as a prerequisite.
5. **isPalindrome**: A function to check if a string is a palindrome.
6. **groupSumtoN**: A function to group elements of a list into sublists whose sums are less than or equal to a given value.

## HW2
In this project, I applied more advanced Haskell techniques to solve problems such as:
1. **merge2, merge2Tail, and mergeN**: Functions to merge lists in various ways.
2. **getInRange and countInRange**: Functions to filter and count elements within a range.
3. **addLengths and addAllLengths**: Functions to sum lengths represented in different units.
4. **sumTree and createSumTree**: Functions to sum elements in a tree and create trees with summed values.
5. **foldListTree**: A function to fold a tree structure.

## Unit Tests
In this project, I applied unit tests using the HUnit framework to ensure the correctness of my functions. Each function was tested with a variety of inputs, covering edge cases and typical values.

## Topics and Lessons Covered
In this project, I applied several key concepts of functional programming in Haskell:
- **Recursion**: Writing functions that call themselves to solve problems.
- **Tail Recursion**: Optimizing recursive functions to avoid stack overflow.
- **Higher-Order Functions**: Using functions like `map`, `filter`, and `foldr` to process lists.
- **Type Systems**: Leveraging Haskell's strong type system to write robust code.
- **Tree Manipulation**: Working with tree data structures to solve complex problems.
- **Unit Testing**: Ensuring code correctness through comprehensive testing with HUnit.

This project demonstrates the power and elegance of Haskell in solving complex programming problems through functional programming principles.





--- 
# Acknowledgments
This codebase and all supporting materials was made as apart of a course for my undergrad at WSU for CPTS 355 - Programming Language Design in the Summer of 2023. 

