//
//  DivideOperatorTests.swift
//  CalculatorTests
//
//  Created by 김진태 on 2021/11/14.
//

import XCTest
@testable import Calculator

class DivideOperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .divide
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testDivideTwoNumbers() {
        let firstNumber = 3.0
        let secondNumber = 6.0
        
        let calculatedResult = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        XCTAssertEqual(calculatedResult, firstNumber / secondNumber)
    }
    
    func testDivideThreeNumbers() {
        let firstNumber = 6.0
        let secondNumber = 9.0
        let thirdNumber = 96.0
        
        var calculatedResult = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        calculatedResult = sut.calculate(lhs: calculatedResult, rhs: thirdNumber)
        
        XCTAssertEqual(calculatedResult, firstNumber / secondNumber / thirdNumber)
    }
    
    func testDivideUsingOne() {
        let firstNumber = 36.0
        let secondNumber = 0.0
        
        var calculatedResult = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        
        XCTAssertThrowsError(calculatedResult)
    }
}