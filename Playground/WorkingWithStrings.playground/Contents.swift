//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"
var newString = str + " Rob"


let newTypeString = NSString(string: newString)

newTypeString.substring(to: 5)//擷取到第幾個
newTypeString.substring(from: 4)//從第幾個開始擷取
NSString(string: newTypeString.substring(from: 6)).substring(to: 3)
newTypeString.substring(with: NSRange(location: 6,length: 3))//範圍擷取


if newTypeString.contains("Rob"){
    print("Rooooooobbbbbb")
}


newTypeString.components(separatedBy: " ") //由什麼分開
newTypeString.uppercased //全大寫
newTypeString.lowercased //全小寫



