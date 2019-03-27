//
//  ViewController.swift
//  calculator
//
//  Created by Kumari, Reena on 7/25/18.
//  Copyright © 2018 Kumari, Reena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var firstNumber: Double = 0;
    var operatorCode: Int = -1;
    var currentNumber: String="";
    var operatorLookup = [12: "^",
                          13: "%",
                          14: "/",
                          15: "X",
                          16: "-",
                          17: "+"];
    
    func cal(_ firstNumber: Double, _ currentNumber: Double) -> Double {
       //var result = firstNumber;
        switch operatorCode {
            case 17 :
               return firstNumber + currentNumber
            case 16:
                return firstNumber - currentNumber
            case 15 :
                return firstNumber * currentNumber
            case 14:
                return firstNumber / currentNumber
            case 13 :
                return firstNumber / 100
            case 12:
                return pow(firstNumber,currentNumber)

            default :
                return firstNumber
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func numbers(_ sender: UIButton) {
        let buttonValue = sender.tag == 0 ? "." : String(sender.tag-1);
        display.text = display.text! + buttonValue;
        print(display.text!);
        currentNumber = currentNumber + buttonValue;
    }

    @IBAction func clear(_ sender: UIButton) {
        display.text = "0";
        currentNumber = "";
        operatorCode = -1;
        firstNumber = 0;
    }
    
    @IBAction func operations(_ sender: UIButton) {
        operatorCode = sender.tag;
        firstNumber = Double(currentNumber)!
        currentNumber = sender.tag == 13 ? "0" : "";
        display.text = display.text! + operatorLookup[operatorCode]!;
        
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        firstNumber = cal(firstNumber, Double(currentNumber)!);
        display.text = String(firstNumber);
        currentNumber = display.text!;
    }
    
}

