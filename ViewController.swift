//
//  ViewController.swift
//  Wage Calculator
//
//  Created by Antonio Thomas Atkinson on 7/4/17.
//  Copyright © 2017 Antonio Thomas Atkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    //Variables
    @IBOutlet weak var wageTitle: UILabel!
    
    @IBOutlet weak var hoursWorked: UITextField!
    @IBOutlet weak var hourWage: UITextField!
    
    @IBOutlet weak var grossPay: UILabel!
    
    //Functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hoursWorked.keyboardType = UIKeyboardType.decimalPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func calculatePay(_ sender: UIButton) {
        let wageIn:Int = Int(hourWage.text!)!
        let hoursWorkedIn:Int = Int(hoursWorked.text!)!
        let grossPayOut = hoursWorkedIn*wageIn
        
        
        grossPay.text = "Gross Pay: $" + String(grossPayOut)
    }


}

