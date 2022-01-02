//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Ufuk Canlı on 2.01.2022.
//

import Foundation

final class CalculatorManager {
    
    private(set) var working = ""
    private(set) var result = ""
    
    func clearAll() {
        working = ""
        result = ""
    }
    
    func clearLast() {
        guard !working.isEmpty else { return }
        working.removeLast()
    }
    
    func addToWorking(value: String) {
        working += value
    }
    
    func calculate() {
        guard !working.isEmpty else { return }
        let expression = NSExpression(format: working)
        let resultDouble = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = format(result: resultDouble)
        result = resultString
    }
    
    private func format(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
}
