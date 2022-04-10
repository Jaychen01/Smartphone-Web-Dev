//
//  NetworkingFile.swift
//  StockPrice
//
//  Created by jay on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON


    func getStockPriceURL(_ symbol : String) -> String{
        let url = "\(URL)\(symbol.uppercased())?apikey=\(apiKey)"
        return url
    }

    func getStockData(_ url : String) -> Promise<StockModel>{
        
        return Promise<StockModel> { seal -> Void in
            
            AF.request(url).responseJSON { response in
            
                if response.error != nil {
                    seal.reject(response.error!)
                }
                
                let stock = StockModel("", "")
                
                let stockJSONArray = JSON(response.data!).arrayValue
                guard let stockJSON = stockJSONArray.first else {return seal.fulfill(stock)}

                stock.symbol = stockJSON["symbol"].stringValue
                stock.name = stockJSON["name"].stringValue
                stock.price = stockJSON["price"].floatValue
                stock.dayLow = stockJSON["dayLow"].floatValue
                stock.dayHigh = stockJSON["dayHigh"].floatValue
                
                seal.fulfill(stock)

            }
        }
    }

