//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Stock {
    var code: String?
    var price: Double?
}

func findStockCode(_ n: String) -> Stock? {
    switch n {
    case "Apple":
        let aapl = Stock()
        aapl.code = "AAPL"
        aapl.price = 117.91
        
        return aapl
    case "Google":
        let goog = Stock()
        goog.code = "GOOG"
        goog.price = 806.15
        
        return goog
    case "Amazon":
        let amzn = Stock()
        amzn.code = "AMZN"
        amzn.price = 795.99
        
        return amzn
    default:
        return nil
    }
}


if let stockApple = findStockCode("Apple") {
    if let sharePrice = stockApple.price {
        let twdCast = 32 * sharePrice
        print(twdCast)
    }
}

if let stockAmazonPrice = findStockCode("Amazon")?.price {
    let twdCast = 32 * stockAmazonPrice
    print(twdCast)
}













