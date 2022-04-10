//
//  StockModel.swift
//  StockPrice
//
//  Created by jay on 4/10/22.
//

import Foundation

class StockModel {
    init(_ name : String, _ symbol : String){
            self.name = name
            self.symbol = symbol
        }
    var symbol : String = ""
    var name : String = ""    
    var price : Float = 0.0
    var dayLow : Float = 0.0
    var dayHigh : Float = 0.0
    
}
