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
        working = "dsd"
        result = "dsds"
    }
    
    func addToWorking(value: String) {
        working += value
    }
}
