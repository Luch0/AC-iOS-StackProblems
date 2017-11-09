//
//  AC_iOS_StackProblemsTests.swift
//  AC-iOS-StackProblemsTests
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import XCTest
@testable import AC_iOS_StackProblems

class AC_iOS_StackProblemsTests: XCTestCase {
    
    var myStack = Stack<Int>()
    var emptyStack = Stack<Int>()
    var myOtherStack = Stack<Int>()
    
    override func setUp() {
        super.setUp()
        myStack.push(5)
        myStack.push(9)
        myStack.push(17)
        myStack.push(30)
        
        myOtherStack.push(15)
        myOtherStack.push(120)
        myOtherStack.push(2)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    
    func testLargest() {
        XCTAssertTrue(largestElement(in: myStack) == 30)
        XCTAssertTrue(largestElement(in: myOtherStack) == 120)
        XCTAssertNil(largestElement(in: emptyStack))
    }
    
    func testSum() {
        XCTAssertTrue(sum(of: myStack) == 61)
        XCTAssertTrue(sum(of: myOtherStack) == 137)
        XCTAssertNil(sum(of: emptyStack))
    }
    
    func testReverse() {
        var myReversedStack = Stack<Int>()
        myReversedStack.push(30)
        myReversedStack.push(17)
        myReversedStack.push(9)
        myReversedStack.push(5)
        
        var userReversedStack = reversed(stack: myStack)
        
        for _ in 0..<3 {
            XCTAssertTrue(myReversedStack.pop() == userReversedStack.pop())
        }
    }
    
    func testIsEqual() {
        XCTAssertFalse(equalStacks(stackOne: myStack, stackTwo: myOtherStack))
        XCTAssertTrue(equalStacks(stackOne: myStack, stackTwo: myStack))
        XCTAssertTrue(equalStacks(stackOne: myOtherStack, stackTwo: myOtherStack))
        XCTAssertTrue(equalStacks(stackOne: emptyStack, stackTwo: emptyStack))
    }
    
    func testPushBottom() {
        var pushedBottomStack = Stack<Int>()
        pushedBottomStack.push(40)
        pushedBottomStack.push(5)
        pushedBottomStack.push(9)
        pushedBottomStack.push(17)
        pushedBottomStack.push(30)
        
        XCTAssertTrue(equalStacks(stackOne: pushedBottomStack, stackTwo: pushBottom(stack: myStack, newElement: 40)))
        
    }
    
    //
    
    func testIsBalanced() {
        XCTAssertTrue(isBalanced(str: "((()))"))
        XCTAssertFalse(isBalanced(str: "((())"))
        XCTAssertTrue(isBalanced(str: "(()((())()))"))
        XCTAssertTrue(isBalanced(str: "(()((())(())))"))
        XCTAssertFalse(isBalanced(str: "))))(((("))
    }
    
    func testConvertToBinary() {
        XCTAssertTrue(convertToBinary(50) == "110010")
        XCTAssertTrue(convertToBinary(131) == "10000011")
        XCTAssertTrue(convertToBinary(27) == "11011")
    }
}
