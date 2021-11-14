//
//  Operator.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate(lhs: Double, rls: Double) -> Double {
        return 0.0
    }
    
    private func add(lhs: Double, rls: Double) -> Double {
        return 0.0
    }
    
    private func subtract(lhs: Double, rls: Double) -> Double {
        return 0.0
    }
    
    private func divide(lhs: Double, rls: Double) -> Double {
        return 0.0
    }
    
    private func multiply(lhs: Double, rls: Double) -> Double {
        return 0.0
    }
}