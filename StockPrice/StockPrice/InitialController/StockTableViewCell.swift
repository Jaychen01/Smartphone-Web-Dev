//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by jay on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    var sendstockDelegate : SendStockDelegate?
    var symbol = ""
    var name = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func getPriceAction(_ sender: Any) {
        let currentURL = getStockPriceURL("\(symbol)")
                
        getStockData(currentURL).done { currentStockModel in
            currentStockModel.symbol = self.symbol
            self.sendstockDelegate?.sendStockData(currentStockModel)
                    
        }
        .catch { error in
            print(error.localizedDescription)
        }
        
    }
}
