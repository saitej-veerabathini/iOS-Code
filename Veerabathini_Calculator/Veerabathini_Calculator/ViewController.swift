import UIKit

class ViewController: UIViewController {
    
 
  
    @IBOutlet weak var displayLabel: UILabel!
    
    var number1 = ""
    var number2 = ""
    var result = ""
    var operand = ""
    var instanceNumber = ""
    var isSignChange = false
    var inChainMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAC(_ sender: UIButton) {
        allClear()
    }
    
    func allClear(){
        number1 = ""
        number2 = ""
        isSignChange = false
        operand = ""
        instanceNumber = ""
        displayLabel.text = ""
        inChainMode = false
    }
    
    func setData(_ number: String){
        if displayLabel.text == "0"{
            displayLabel.text = ""
        }
        else{
            if !isSignChange{
                displayLabel.text! += number
                number1 += number
            }
            else{
                if !inChainMode{
                    displayLabel.text! += number
                    number2 += number
                }
                else{
                    displayLabel.text = ""
                    displayLabel.text! += number
                    number2 += number
                }
            }
        }
    }
    
    func calTemp(_ operand:String)->String {
        if number1 != "" && number2 != ""{
            if operand == "+"{
                number1 = String(Double(number1)! + Double(number2)!)
                instanceNumber = number2
                number2 = ""
                return String(number1)
            }
            if operand == "-"{
                number1 = String(Double(number1)! - Double(number2)!)
                instanceNumber = number2
                number2 = ""
                return String(number1)
            }
            if operand == "*"{
                number1 = String(Double(number1)! * Double(number2)!)
                instanceNumber = number2
                number2 = ""
                return String(number1)
            }
            if operand == "/"{
                number1 = String(Double(number1)! / Double(number2)!)
                instanceNumber = number2
                number2 = ""
                return String(number1)
            }
            if operand == "%" {
                let s1 = Double(number1)!
                let s2 = Double(number2)!
                var r = s1.remainder(dividingBy: s2)
                number1 = String(r)
                instanceNumber = number2
                number2 = ""
                return String(number1)
            }
        }
        return ""
    }
    
    func formatResult(_ result:String)->String {
        let value = Double(result)!
        var resultStr = String(round(value * 100000) / 100000.0)
        if resultStr.contains(".0"){
            resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
        }
        return resultStr
    }
    
  
    @IBAction func btnC(_ sender: UIButton) {
        number2 = ""
        displayLabel.text = ""
    }
    
    @IBAction func btnSignChange(_ sender: UIButton) {
        if number1 == ""{
            displayLabel.text = "-" + displayLabel.text!
            number1 = "\(displayLabel.text!)"
        }
        else{
            displayLabel.text = "-" + displayLabel.text!
            number2 = "\(displayLabel.text!)"
        }
    }
    
    @IBAction func btnDivide(_ sender: UIButton) {
        let temp = calTemp(operand)
        operand = "/"
        displayLabel.text = (temp != "") ? formatResult(temp) : ""
        if temp != "" {
            // inChainmode = true
            if number2 != ""{
                inChainMode = true
                if isSignChange {
                    result = String(Double(temp)! / Double(number2)!)
                    print(result)
                    if result == "inf"{
                        displayLabel.text! = "Error"
                    }
                    else{
                        displayLabel.text! = formatResult(result)
                    }
                }
            }
        }
        isSignChange = true
    }
    
   
    @IBAction func btnMultiplication(_ sender: UIButton) {
        let temp = calTemp(operand)
        print("temp is \(temp)")
        operand = "*"
        instanceNumber=""
        displayLabel.text = (temp != "") ? formatResult(temp) : ""
        isSignChange = true
    }
    
    
    @IBAction func btnSub(_ sender: UIButton) {
        if(number1 == ""){
           number1 = "0"
        }
        let temp = calTemp(operand)
        print("temp is \(temp)")
        operand = "-"
        instanceNumber=""
        displayLabel.text = (temp != "") ? formatResult(temp) : ""
        isSignChange = true
    }
    

    @IBAction func btnAdd(_ sender: UIButton) {
        let temp = calTemp(operand)
        print("temp is \(temp)")
        operand = "+"
        instanceNumber=""
        displayLabel.text = (temp != "") ? formatResult(temp) : ""
        isSignChange = true
    }
    
    @IBAction func btnEquals(_ sender: UIButton) {
        var res = ""
        switch operand {
            case "+":
            if instanceNumber != "" {
                res = String(Double(number1)! + Double(instanceNumber)!)
                displayLabel.text = formatResult(res)
                number2 = instanceNumber
            }
            else{
                res = String(Double(number1)! + Double(number2)!)
                displayLabel.text = formatResult(res)
            }
            number1 = res
            break
            case "*":
            if instanceNumber != "" {
                res = String(Double(number1)! * Double(instanceNumber)!)
                displayLabel.text = formatResult(res)
            }
            else{
                res = String(Double(number1)! * Double(number2)!)
                displayLabel.text = formatResult(res)
            }
            number1 = res
            break
            case "-":
            if instanceNumber != "" {
                res = String(Double(number1)! - Double(instanceNumber)!)
                displayLabel.text = formatResult(res)
            }
            else {
                res = String(Double(number1)! - Double(number2)!)
                displayLabel.text = formatResult(res)
            }
            number1 = res
            break
            case "/":
            if displayLabel.text == "Error"{
                allClear()
            }
            else {
                if instanceNumber != "" {
                    res = String(Double(number1)! / Double(instanceNumber)!)
                    if res == "inf"{
                        displayLabel.text! = "Error"
                        return
                    }
                    else {
                        displayLabel.text = formatResult(res)
                    }
                }
                else {
                    res = String(Double(number1)! / Double(number2)!)
                    if res == "inf"{
                        displayLabel.text! = "Error"
                        return
                    }
                    else {
                        displayLabel.text = formatResult(res)
                    }
                }
                number1 = res
            }
            break
            case "%":
            if instanceNumber != "" {
                displayLabel.text = formatResult(res)
                let s1 = Double(number1)!
                let s2 = Double(instanceNumber)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                number2 = instanceNumber
            }
            else {
                let s1 = Double(number1)!
                let s2 = Double(number2)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                displayLabel.text = formatResult(res)
            }
            number1 = res
            break
        default:
            print("IOS")
        }
    }
    
    @IBAction func btnMod(_ sender: UIButton) {
        let temp = calTemp(operand)
        print("temp is \(temp)")
        operand = "%"
        instanceNumber=""
        displayLabel.text = (temp != "") ? formatResult(temp) : ""
        isSignChange = true
    }
    
    @IBAction func btnDecimal(_ sender: UIButton) {
        setData(".")
    }
    
    @IBAction func btn0(_ sender: UIButton) {
        setData("0")
    }
    
    
    @IBAction func btn1(_ sender: UIButton) {
        setData("1")
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        setData("2")
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        setData("3")
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        setData("4")
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        setData("5")
    }
    
    @IBAction func btn6(_ sender: UIButton) {
        setData("6")
    }
    
    @IBAction func btn7(_ sender: UIButton) {
        setData("7")
    }
    
    @IBAction func btn8(_ sender: UIButton) {
        setData("8")
    }
    
   
    @IBAction func btn9(_ sender: UIButton) {
        setData("9")
    }
    
}

