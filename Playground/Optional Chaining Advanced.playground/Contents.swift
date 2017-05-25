//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



class Yasuoyuhao {
    var stock: Stock?
}

class StockName {
    var name : String
    init(name: String) {
        self.name = name
    }
}

class Stock {
    var stockName = [StockName]()
    
    var numberOfStock: Int {
        return stockName.count
    }
    
    subscript(i: Int) -> StockName {
        get {
            return stockName[i]
        }
        set {
            stockName[i] = newValue
        }
    }
}


let yasuoyuhao = Yasuoyuhao()

if let firstStockName = yasuoyuhao.stock?[0].name {
    print(firstStockName)
} else {
    print("無法取得第一個投資組合")
}

yasuoyuhao.stock?[0] = StockName(name: "Apple") //nil


yasuoyuhao.stock = Stock()
if yasuoyuhao.stock?.stockName != nil {
    print("Chaining成功")
} else {
    print("Chaining失敗")
}


let yasuoyuhaoInvesting = Stock()
yasuoyuhaoInvesting.stockName.append(StockName(name: "Apple"))
yasuoyuhaoInvesting.stockName.append(StockName(name: "Google"))
yasuoyuhaoInvesting.stockName.append(StockName(name: "Amazon"))

yasuoyuhao.stock = yasuoyuhaoInvesting

if let firstStock = yasuoyuhao.stock?[0].name {
    print(firstStock)
} else {
    print("無法取得第一個投資組合")
}


















