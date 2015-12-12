//
//  ViewController.swift
//  labor3
//
//  Created by Braun Ádám on 2015. 11. 29..
//  Copyright © 2015. asd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum OperationType {
        case Add
        case Mul
        case Div
    }
    
    //Connectors
    @IBOutlet weak var inputTextFieldA: UITextField!
    @IBOutlet weak var inputTextFieldB: UITextField!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    //Variables
    var operationType = OperationType.Add
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Events
    @IBAction func calculateButtonTouchUpInside(sender: AnyObject) {
        let numberFormater = NSNumberFormatter()
        var result: Double
        var operationChar: String
        if let textA = inputTextFieldA.text, textB = inputTextFieldB.text, a = numberFormater.numberFromString(textA)?.doubleValue, b = numberFormater.numberFromString(textB)?.doubleValue {
            switch operationType
            {
            case .Add:
                 result = a + b
                 operationChar = "+"
            case .Div:
                 result = a / b
                 operationChar = "/"
            case .Mul:
                 result = a * b
                 operationChar = "*"
            }
            
            resultLabel.text = "\(result)"
            historyTextView.text = "\(a) \(operationChar) \(b) = \(result)" + historyTextView.text
            
        }
    }
    @IBAction func backgroundTouchUpInside(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func operationSelectorValueChanged(sender: AnyObject) {
        switch segmentedController.selectedSegmentIndex
        {
        case 0:
            operationType = .Add
        case 1:
            operationType = .Mul
        case 2:
            operationType = .Div
        default:
            operationType = .Add
        }
    }
}