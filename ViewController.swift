//
//  ViewController.swift
//  calculator3
//
//  Created by Bhinder on 20/11/20.
//


import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
    }

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = "0"
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 10 {
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
        } }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = "0"
        
    }
    @IBAction func dotPressed(_ sender: UIButton) {
        if runningNumber.count <= 10 {
        runningNumber += "."
        outputLbl.text = runningNumber
        
        }}
    
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operation){
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                
                leftValue = result
                
               if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                   result = "\(Int(Double(result)!))"
               }
                outputLbl.text = result
            }
            currentOperation = operation
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    
}
