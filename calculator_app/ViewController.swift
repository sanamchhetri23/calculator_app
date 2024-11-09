import UIKit

class ViewController: UIViewController {
    @IBOutlet var calculatorNumbers: UILabel!
    @IBOutlet var calculatorResults: UILabel!
    var currentNumber = ""
    var previousNumber = ""
    var currentOperation: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load")
        calculatorResults.text = "0"
    }

    @IBAction func numbersTapped(_ sender: UIButton) {
        print("Action triggered")

        if let number = sender.titleLabel?.text {
            if number == "." {
                if !currentNumber.contains(".") {
                    currentNumber += number
                    print("Button tapped: \(number)")
                }
            } else {
                print("Button tapped: \(number)")
                currentNumber += number
            }
            
            calculatorNumbers.text = currentNumber
        } else {
            print("Failed to get button title")
        }
    }

    @IBAction func arthmaaticOperator(_ sender: UIButton) {
        print("Action triggered")
        
        if let operatorSign = sender.titleLabel?.text {
            print("Operator tapped: \(operatorSign)")

            if !currentNumber.isEmpty {
                previousNumber = currentNumber
                currentNumber = ""
            }

            currentOperation = operatorSign
            calculatorNumbers.text = previousNumber + " " + operatorSign
        }
    }

    @IBAction func clearBtnTapped(_ sender: Any) {
        print("\(String(describing: calculatorResults))\(String(describing: calculatorNumbers))")
        calculatorResults.text = "0"
        calculatorNumbers.text = ""
        currentNumber = ""
        previousNumber = ""
        currentOperation = nil
    }

    @IBAction func EqualsToButtonTapped(_ sender: UIButton) {
        print("Equals button tapped")
        if let operation = currentOperation, let firstNum = Double(previousNumber), let secondNum = Double(currentNumber) {
            var result: Double = 0

    
            switch operation {
            case "+":
                result = firstNum + secondNum
            case "-":
                result = firstNum - secondNum
            case "x":
                result = firstNum * secondNum
            case "/":
                if secondNum != 0 {
                    result = firstNum / secondNum
                } else {
                    calculatorResults.text = "Error"
                    return
                }
            default:
                break
            }
            calculatorResults.text = String(result)
            currentNumber = String(result)
            previousNumber = ""
            currentOperation = nil
        }
    }
}
