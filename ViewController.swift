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
    @IBOutlet weak var netPay: UILabel!
    @IBOutlet weak var federalTaxPercentage: UITextField!
    @IBOutlet weak var stateTaxPercentage: UITextField!
    @IBOutlet weak var federalTaxRate: UITextField!
    @IBOutlet weak var stateTaxRate: UITextField!
    @IBOutlet weak var ssnTaxPercentage: UITextField!
    @IBOutlet weak var medicareTaxPercentage: UITextField!
    @IBOutlet weak var ssnTaxRate: UITextField!
    @IBOutlet weak var medicareTaxRate: UITextField!
    
    
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
        let grossPay = CalcGrossPay()
        CalcNetPay(grossPay: grossPay)
    }
    @IBAction func CalculateFederalTax(_ sender: Any) {
        let grossPay = CalcGrossPay()
        var federalTax:Double = Double(federalTaxRate.text!)!
        federalTax = (1-((Double(grossPay)-federalTax)/Double(grossPay)))
        federalTaxPercentage.text = String(format: "%.4f",federalTax)
    }
    @IBAction func CalculateStateTax(_ sender: Any) {
        let grossPay = CalcGrossPay()
        var stateTax:Double = Double(stateTaxRate.text!)!
        stateTax = (1-((Double(grossPay)-stateTax)/Double(grossPay)))
        stateTaxPercentage.text = String(format: "%.4f",stateTax)
    }
   
    @IBAction func CalculateSSTax(_ sender: Any) {
        let grossPay = CalcGrossPay()
        var ssTax:Double = Double(ssnTaxRate.text!)!
        ssTax = (1-((Double(grossPay)-ssTax)/Double(grossPay)))
        ssnTaxPercentage.text = String(format: "%.4f",ssTax)
    }
    
    @IBAction func CalculateMedicareTax(_ sender: Any) {
        let grossPay = CalcGrossPay()
        var medicareTax:Double = Double(medicareTaxRate.text!)!
        medicareTax = (1-((Double(grossPay)-medicareTax)/Double(grossPay)))
        medicareTaxPercentage.text = String(format: "%.4f",medicareTax)
    }
    func CalcGrossPay()->Double{
        let wageIn:Double = Double(hourWage.text!)!
        let hoursWorkedIn:Double = Double(hoursWorked.text!)!
        let grossPayOut = hoursWorkedIn*wageIn
        
        
        grossPay.text = "Gross Pay: $" + String(format: "%.2f",grossPayOut)
        return grossPayOut;
    }
    func CalcNetPay(grossPay:Double){
        let fedTax:Double = Double(federalTaxRate.text!)!
        let stTax:Double=Double(stateTaxRate.text!)!
        let ssTax:Double = Double(ssnTaxPercentage.text!)!
        let medicareTax:Double = Double(medicareTaxRate.text!)!
        netPay.text = "Net Pay: $"+String(format: "%.2f",Double(grossPay)-fedTax-stTax-ssTax-medicareTax)
    }
}

