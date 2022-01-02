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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.clearAll()
        updateUI()
    }
    
    @IBAction func someButtonDidTap(_ sender: UIButton) {
        callManager(sender)
        updateUI()
    }
}

private extension CalculatorViewController {
    
    func updateUI() {
        workingLabel.text = manager.working
        resultLabel.text = manager.result
    }
    
    func callManager(_ sender: UIButton) {
        guard let value = sender.titleLabel?.text else { return }
        switch sender.tag {
        case 11:
            manager.clearAll()
        case 12:
            manager.clearLast()
        case 15:
            guard manager.isValidInput() else {
                displayAlert(
                    title: "Ooops!",
                    message: "This is not a valid operation.",
                    buttonTitle: "OK"
                )
                return
            }
            manager.calculate()
        default:
            manager.addToWorking(value: value)
        }
    }
}
