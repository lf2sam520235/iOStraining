//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


enum SomeEnumeration {
    // enumeration definition goes here
}

//這是一個定義指南針四個方位的列舉
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 多個成員值可以寫在同一行 以逗號 , 隔開
// 這是一個定義太陽系八大行星的列舉
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 這邊使用上面定義過的指南針方位的列舉

// 型別為 CompassPoint 的一個變數 值為其列舉內的 west
var directionToHead = CompassPoint.west

// 這時已經可以自動推斷這個變數的型別為 CompassPoint
// 如果要再指派新的值 可以省略列舉的型別名稱
directionToHead = .north



directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins") // 這行會被印出
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}


//以下是一個例子，假設建立一個庫存追蹤系統，商品條碼可能會有UPC-A格式的一維碼，每一個UPC-A條碼是一組四個正整數的值，或是使用QR Code格式的二維碼，每一個QR Code條碼是一個最多為 2,953 字元的字串，依據這個條件建立的列舉如下：
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// 指派 Barcode 型別 成員值為 upc
// 相關值為 (8, 85909, 51226, 3)
var productBarcode = Barcode.upc(8, 85909, 51226, 3)

// 如果要修改為儲存 QR Code 條碼
productBarcode = .qrCode("ABCDEFG")

// 這時 .upc(8, 85909, 51226, 3) 會被 .qrCode("ABCDEFG") 所取代
// 一個變數 同一時間只能儲存一個列舉的成員值(及其相關值)

switch productBarcode {
case .upc(
    let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer),\(product), \(check).")
case .qrCode(let productCode):
    print("QR Code: \(productCode).") // 會印出這行
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR Code: \(productCode).")
}


//原始值
//
//除了使用相關值的列舉，其內的成員值可以儲存不同型別的相關值。Swift 也提供列舉先設置原始值(raw value)來代替相關值，這些原始值的型別必須相同。使用方法為在列舉名稱後加上冒號:並接著原始值型別，例子如下：
enum WeekDay: Int {
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
}

let today = WeekDay.friday
// 使用 rawValue 屬性來取得原始值
// 印出：5
print(today.rawValue)

// 第一個成員有設置原始值 1, 接著下去成員的原始值就是 2, 3, 4 這樣遞增下去
enum SomePlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let ourPlanet = SomePlanet.earth

// 印出：3
print(ourPlanet.rawValue)

enum AnotherCompassPoint: String {
    case north, south, east, west
}

let directionPoint = AnotherCompassPoint.east

// 印出：east
print(directionPoint.rawValue)


//使用原始值初始化列舉實體
//
//在定義列舉時，如果使用了原始值，則這個列舉會有一個初始化方法(method)，這個方法有一個名稱為rawValue的參數，其參數型別就是列舉原始值的型別，返回值為列舉成員或nil。例子如下：
// 一個使用原始值的列舉 原始值依序是 1,2,3,4,5,6,7,8
enum OtherPlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let possiblePlanet = OtherPlanet(rawValue: 7)
// possiblePlanet 型別為 OtherPlanet? 值為 OtherPlanet.uranus


let positionToFind = 9
if let targetPlanet = OtherPlanet(rawValue: positionToFind) {
    switch targetPlanet {
    case .earth:
        print("We are here !")
    default:
        print("Not Safe !")
    }
} else {
    print("No planet at position \(positionToFind)")
}
// 印出：No planet at position 9


//遞迴列舉
//
//遞迴列舉(recursive enumeration)是一種列舉型別，它會有一個或多個列舉成員使用該列舉型別的實體作為相關值。如果要表示一個列舉成員可以遞迴，必須在成員前面加上indirect，例子如下：
// 定義一個列舉

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

    
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(left, right):
            return evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
        }
    }


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

    print(evaluate(product))
// Prints "18"



