//
//  ViewController.swift
//  Calculator
//
//  Created by Abhishek Bansal on 2019-07-18.
//  Copyright © 2019 Abhishek Bansal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0;
    
    //Label
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Buttons
    @IBAction func numbers(_ sender: Any)
    {
        if performingMath == true {
            resultLabel.text = String((sender as AnyObject).tag-1)
            numberOnScreen = Double(resultLabel.text!)!
            performingMath = false
        }
        else{
            resultLabel.text = resultLabel.text! + String((sender as AnyObject).tag-1)
            numberOnScreen = Double(resultLabel.text!)!
        }
    }
    
    
    @IBAction func functions(_ sender: Any)
    {
        if resultLabel.text != "" && (sender as AnyObject).tag != 11 && (sender as AnyObject).tag != 16
        {
            
            previousNumber = Double(resultLabel.text!)!
            
            //Divide
            if (sender as AnyObject).tag == 12
            {
                resultLabel.text = "/"
            }
            //Multiply
            else if (sender as AnyObject).tag == 13
            {
                resultLabel.text = "X"
            }
            //Subtract
            else if (sender as AnyObject).tag == 14
            {
                resultLabel.text = "-"
            }
            //Addidtion
            else if (sender as AnyObject).tag == 15
            {
                resultLabel.text = "+"
            }
            
            operation = (sender as AnyObject).tag
            performingMath = true
            
        }
        else if (sender as AnyObject).tag == 16 {
            if operation == 12 {
                resultLabel.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 {
                resultLabel.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 {
                resultLabel.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                resultLabel.text = String(previousNumber + numberOnScreen)
            }
        }
        else if (sender as AnyObject).tag == 11 {
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
}

