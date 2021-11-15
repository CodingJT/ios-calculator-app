//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 김진태 on 2021/11/16.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    func testInputTwoPlusThreeResultIsFive() throws {
        let input = "2+3"
        var formula = ExpressionParser.parse(from: input)
        let calculatedResult = try formula.result()
        let expectedResult: Double = 5
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
}