//
//  ViewController.swift
//  BMICalculator
//
//  Created by jay on 5/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var txtInches: UITextField!
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    var BMI : Double = 0.0
    var res : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    @IBAction func calculateBMI(_ sender: Any) {
        let weight : Double = Double(txtWeight.text!) ?? 0.0
        let feet : Double = Double(txtFeet.text!) ?? 0.0
        let inches : Double = Double(txtInches.text!) ?? 0.0
        let height = feet * 12 + inches
        
        if (height == 0.0) {
            lblResult.text = "UNVALID INPUT"
            return
        }
        
        BMI = 703 * weight / height / height
        
        res = String(format: "%.1f", BMI)
        lblBMI.text = res
        
        if BMI < 18.5 {
            res = "Underweight"
        } else if BMI < 25 {
            res = "Healthy weight"
        } else if BMI < 30 {
            res = "Overweight"
        } else {
            res = "Obese"
        }
        lblResult.text = res
        
    }
    
}

