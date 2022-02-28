//
//  ViewController.swift
//  Calculator
//
//  Created by igor mekkers on 24.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWorking: UILabel!
    @IBOutlet weak var calcilatorResult: UILabel!
    
    var working: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll() {
        working = ""
        calculatorWorking.text = ""
        calcilatorResult.text = ""
    }
    
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any) {
        if(!working.isEmpty) {
            working.removeLast()
            calculatorWorking.text = working
        }
    }
    
    func addToWorking(value: String) {
        working = working + value
        calculatorWorking.text = working
    }
    
    @IBAction func percentTap(_ sender: Any) {
        
        addToWorking(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorking(value: "/")
    }
    @IBAction func multiplyTap(_ sender: Any) {
        addToWorking(value: "*")
    }
    @IBAction func minusTap(_ sender: Any) {
        addToWorking(value: "-")
    }
    @IBAction func plusTap(_ sender: Any) {
        addToWorking(value: "+")
    }
    @IBAction func equalsTap(_ sender: Any) {
        if(validInput()) {
        let checkedWorkingForPercent = working.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedWorkingForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calcilatorResult.text = resultString
        } else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OKay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
}
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in working {
            
            if(specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if(index == 0) {
                return false
            }
            if(index == working.count - 1) {
                return false
            }
            if(previous != -1){
                if(index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool {
        if(char == "*") {
            return true
        }
        if(char == "/") {
            return true
        }
        if(char == "+") {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    @IBAction func decimalTap(_ sender: Any) {
        addToWorking(value: ".")
    }
    @IBAction func zeroTap(_ sender: Any) {
        addToWorking(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addToWorking(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addToWorking(value: "2")
    }
    @IBAction func threeTap(_ sender: Any) {
        addToWorking(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) {
        addToWorking(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        addToWorking(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        addToWorking(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        addToWorking(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addToWorking(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        addToWorking(value: "9")
    }
    
    
}

