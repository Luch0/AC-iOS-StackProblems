//
//  StackProblems.swift
//  AC-iOS-StackProblems
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation



//Problem One:
//Find the largest integer in a Stack of Ints
func largestElement<T: Comparable>(in stack: Stack<T>) -> T? {
    var tempStack = stack
    var largestInt = tempStack.peek() as? Int
    while !tempStack.isEmpty {
        let poppedInt = tempStack.pop() as? Int
        if poppedInt! > largestInt! {
            largestInt = poppedInt
        }
    }
    return largestInt as? T
}


//Problem Two:
//Find the sum of a Stack of Ints
func sum(of stack: Stack<Int>) -> Int? {
    if stack.isEmpty {
        return nil
    }
    var tempStack = stack
    var sum = 0
    while !tempStack.isEmpty {
        let poppedInt = tempStack.pop()
        sum += poppedInt!
    }
    return sum
}

//Problem Three:
//Reverse a Stack without using an Array
//Sample input:
/*
 4
 2
 9
 3
 */

//Sample output:
/*
 3
 9
 2
 4
 */

func reversed<T>(stack: Stack<T>) -> Stack<T> {
    var copyStack = stack
    var reversedStack = Stack<T>()
    while !copyStack.isEmpty {
        reversedStack.push(copyStack.pop()!)
    }
    return reversedStack
}


//Problem Four:
//Determine if two stacks are equal
func equalStacks<T: Equatable>(stackOne: Stack<T>, stackTwo: Stack<T>) -> Bool {
    var copyStackOne = stackOne
    var copyStackTwo = stackTwo
    while !copyStackOne.isEmpty || !copyStackTwo.isEmpty {
        if copyStackOne.pop() != copyStackTwo.pop() {
            return false
        }
    }
    return true
}


//Problem Five:
//Write a function that pushes a new element to the bottom of a Stack
func pushBottom<T>(stack: Stack<T>, newElement: T) -> Stack<T> {
    var resultStack = Stack<T>()
    resultStack.push(newElement)
    var reversedStack = reversed(stack: stack)
    while !reversedStack.isEmpty {
        resultStack.push(reversedStack.pop()!)
    }
    return resultStack
}

//Problem Six:
//Determine if the parentheses are balanced in a given String
//Sample input: ((()))
//Sample output: true
//Sample input: ((())
//Sample output: false
//Sample input: (()((())()))
//Sample output: false

func isBalanced(str: String) -> Bool {
    var balancedStack = Stack<String>()
    for c in str {
        if c == "(" {
            balancedStack.push("(")
        }
        if c == ")" {
            if balancedStack.pop() == nil {
                return false
            }
        }
    }
    if !balancedStack.isEmpty {
        return false
    }
    return true
}

//Bonus: Problem Seven:
//Use a stack to convert a number in decimal to binary
func convertToBinary(_ num: Int) -> String {
    var numCopy = num
    var binaryStack = Stack<String>()
    while numCopy > 0 {
        binaryStack.push(String(numCopy % 2))
        numCopy /= 2
    }
    var binary = ""
    while !binaryStack.isEmpty {
        binary += binaryStack.pop()!
    }
    return binary
}





