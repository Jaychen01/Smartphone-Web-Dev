//
//  ViewController.swift
//  StockPrice
//
//  Created by jay on 4/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendStockDelegate {
    
    @IBOutlet weak var lblname1: UILabel!
    @IBOutlet weak var lbllow1: UILabel!
    @IBOutlet weak var lblprice1: UILabel!
    @IBOutlet weak var lblhigh1: UILabel!
    @IBOutlet weak var lblsymbol1: UILabel!
    @IBOutlet weak var tblView: UITableView!
    var stocksModel : [StockModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stocksModel = initializestocks()
    }
    
    func initializestocks() -> [StockModel]{
            
        let FB = StockModel("facebook inc.", "FB");
        let AAPL = StockModel("apple inc.", "AAPL");
        let GOOG = StockModel("google inc.", "GOOG");
        let MSFT = StockModel("microsoft inc.", "MSFT");
        let AMZN = StockModel("amazon inc.", "AMZN");

        var modelArr = [StockModel]()
            
        modelArr.append(FB)
        modelArr.append(AAPL)
        modelArr.append(GOOG)
        modelArr.append(MSFT)
        modelArr.append(AMZN)
            

        return modelArr
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = stocksModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
                
        guard let models = stocksModel?[indexPath.row] else {return cell}
                
        cell.lblName.text = models.name
        cell.lblSymbol.text = models.symbol
        cell.symbol = models.symbol
        cell.sendstockDelegate = self
        return cell
    }
    
    func sendStockData(_ currentStockModel: StockModel) {
        lblname1.text = currentStockModel.name
        lblsymbol1.text = currentStockModel.symbol
        lblprice1.text = "\(currentStockModel.price)"
        lbllow1.text = "\(currentStockModel.dayLow)"
        lblhigh1.text = "\(currentStockModel.dayHigh)"
            
    }
        
}

