//
//  MetricViewController.swift
//  BMICalculator
//
//  Created by jay on 5/4/22.
//

import UIKit

class MetricViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var txtweight: UITextField!
    @IBOutlet weak var txtheight: UITextField!
    var BMI1 : Double = 0.0
    var res1 : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func calBMI(_ sender: Any) {
        let w : Double = Double(txtweight.text!) ?? 0.0
        let h : Double = Double(txtheight.text!) ?? 0.0
        
        if (h == 0.0) {
            lblResult.text = "UNVALID INPUT"
            return
        }
        
        BMI1 = w / h / h * 10000
        
        res1 = String(format: "%.1f", BMI1)
        lblBMI.text = res1
        
        if BMI1 < 18.5 {
            res1 = "Underweight"
        } else if BMI1 < 25 {
            res1 = "Healthy weight"
        } else if BMI1 < 30 {
            res1 = "Overweight"
        } else {
            res1 = "Obese"
        }
        lblResult.text = res1
        
    }
    
}
