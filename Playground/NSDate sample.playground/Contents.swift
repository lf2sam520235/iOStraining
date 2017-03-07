//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let dateComponents = NSDateComponents()
let day = dateComponents.day
let month = dateComponents.month


let currentDate = NSDate() //取得現在時間
print(currentDate)

let dateFormatter = DateFormatter()//格式化時間
dateFormatter.dateStyle = .long //預設日期格式
dateFormatter.timeStyle = .short //預設時間格式
dateFormatter.dateFormat = "MMM dd,yyyy, h:mm:ss a" //自訂時間格式
dateFormatter.locale = Locale(identifier: "en_US") //美國曆
print(dateFormatter.string(from: currentDate as Date))



