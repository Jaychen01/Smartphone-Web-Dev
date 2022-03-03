//
//  StockViewController.swift
//  CompanyDiscountedCashFlowValue
//
//  Created by jay on 3/2/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {
    
    @IBOutlet weak var txtSymbol: UITextField!
    @IBOutlet weak var lblStockPrice: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDCF: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func searchCompany(_ sender: Any) {
        
        guard let symbol = txtSymbol.text else {return}
        
        let url = "\(DCFURL)\(symbol.uppercased())?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting Value for \(symbol)")
        
        AF.request(url).responseJSON { response in
            
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }

            //let companies = JSON(response.data!).array
            let company = JSON(response.data!)
            //guard let company = companies! else {return}
            
            let dcf = DCF()
            dcf.symbol = company["symbol"].stringValue
            dcf.date = company["date"].stringValue
            dcf.discashflow = company["dcf"].floatValue
            dcf.price = company["Stock Price"].floatValue
            
            self.lblDate.text = "\(dcf.date)"
            self.lblDCF.text = "\(dcf.symbol) : \(dcf.discashflow)"
            self.lblStockPrice.text = "\(dcf.symbol) : \(dcf.price)"
        
        }
        
    }
    
}
