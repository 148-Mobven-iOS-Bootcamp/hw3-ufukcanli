//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Ufuk Canlı on 2.01.2022.
//

import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet weak var workingLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var allButtons: [UIButton]!
    
    private var manager = CalculatorManager()
    
    @IBAction func someButtonDidTap(_ sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        switch sender.tag {
        case 11:
            manager.clearAll()
            updateUI()
        case 12:
            manager.clearLast()
            updateUI()
        case 15:
            manager.calculate()
            updateUI()
        default:
            manager.addToWorking(value: value)
            updateUI()
        }
    }
}

private extension CalculatorViewController {
    func updateUI() {
        workingLabel.text = manager.working
        resultLabel.text = manager.result
    }
}
