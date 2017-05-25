//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//方法(method)為特定型別(類別、結構或列舉)的函式，可以分為兩種：
//實體方法(instance method)：先需要生成一個特定型別(類別、結構或列舉)的實體，才能使用這個實體裡的方法。
//型別方法(type method)：屬於特定型別(類別、結構或列舉)本身的方法。

//
//實體方法
//
//實體方法(instance method)是屬於一個特定型別(類別、結構或列舉)的實體，可以用來存取和設置實體屬性或是提供實體需要的功能。
//實體方法的語法跟使用方式與前面章節提到的函式一樣，使用func關鍵字建立，並需要放在這個定義的特定型別(類別、結構或列舉)的大括號{}內，例子如下：
// 定義一個類別 Counter
class Counter {
    
    // 定義一個變數屬性 預設值為零
    var count = 0
    
    // 定義一個實體方法 會將變數屬性加一
    func increment() {
        self.count += 1
    }
    // 定義一個實體方法 會將變數屬性加上一個傳入的數字
    func increment(by amount: Int) {
        count += amount
    }
    
    // 定義一個實體方法 會將變數屬性歸零
    func reset() {
        count = 0
    }
}
//上述程式中，定義了一個簡單的計數器的類別，如果要呼叫方法的話，也是像屬性一樣使用點語法(dot syntax)，如下：
// 生成一個實體 counter 其內的計數值屬性初始化為 0
let counter = Counter()

// 呼叫其內的一個實體方法 現在計數值為 1
counter.increment()

// 呼叫其內的一個實體方法, 傳入一個參數 9, 現在計數值為 10
counter.increment(by: 9)

// 呼叫其內的一個實體方法, 將計數值歸零, 現在計數值為 0
counter.reset()
//實體方法(instance method)的參數定義方式與前面章節提到的函式相似，一樣需要有參數標籤(argument label)及參數名稱(parameter name)。

//在實體方法中修改值型別
//
//一般情況下，一個值型別(結構或列舉)實體的屬性，不能在它的實體方法中被修改。但如果有特殊需求需要修改屬性，可以使用變異(mutating)這個方法。要使用變異方法，將關鍵字mutating放在方法的func之前就可以了，如下：
//定義一個結構 Point

struct Point {
    // 兩個變數屬性 可以代表一個二維圖上的一個點
    var x = 0.0, y = 0.0
    
    // 一個變異方法 會將兩個屬性各別加上一個值
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY

    }
}
//struct AnotherPoint {
//  var x = 0.0, y = 0.0
//  mutating func moveByX(deltaX: Double, y deltaY: Double) {
//      self = AnotherPoint(x: x + deltaX, y: y + deltaY)
//      }
//}

// 生成一個結構的實體的變數 並給初始值
var somePoint = Point(x: 1.0, y: 1.0)

// 修改其內的屬性值
somePoint.moveBy(x: 2.0, y: 3.0)

// 現在兩個屬性已經被改變了
// 印出：x: 3.0, y: 4.0
print("x: \(somePoint.x), y: \(somePoint.y)")
//要注意一點，上述程式中如果生成實體的是一個常數，則無法使用變異方法來改變屬性，即使屬性是變數也不行。


//另外在列舉中使用變異方法，可以把self設置為相同的列舉型別中不同的成員，如下：
// 定義一個三態開關的列舉
enum TriStateSwitch {
    // 列舉的三個成員
    case off, low, high
    
    // 變異方法 會在三個成員中依序切換
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

// 宣告一個列舉的變數 且目前 ovenLight 為 TriStateSwitch.low
var ovenLight = TriStateSwitch.low

// 每次呼叫這個變異方法 都會在三個成員中依序切換
ovenLight.next()
// 現在 ovenLight 為 .high
ovenLight.next()
// 現在 ovenLight 為 .off

//型別方法
//
//型別方法(type method)為定義在特定型別(類別、結構與列舉)上的方法。不是屬於實體，而是屬於這個型別(類別、結構或列舉)本身的方法，與實體方法一樣使用點語法(dot syntax)呼叫。
//宣告型別方法時需要在func前加上關鍵字static。而以類別來說，還可以將static替換成class來允許子類別覆寫(override)父類別的類別方法。
//例子如下：
// 定義一個類別

class SomeClass {
    // 定義一個型別方法
    class func someTypeMethod() -> String {
        print("")
        let n = "型別方法"
        return n
    }
}

// 呼叫一個型別方法
//SomeClass.someTypeMethod()
//上述程式中可以看到，不用生成實體就可以直接呼叫型別方法，因為型別方法是屬於一個特定型別(類別、結構與列舉)而不是一個實體。
//後面章節會正式介紹繼承(子類別與父類別的關係)。


print(SomeClass.someTypeMethod())
