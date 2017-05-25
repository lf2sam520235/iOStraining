//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func name(title t:String) -> String{ //外部標籤 內部標籤
    var code = ""
    code = t + "ing"
    return code
}


name(title: "office")
name(title: "play")


func hello(_ name: String, age a: Int) {
    print("\(name) is \(a) years old .")
}

// 呼叫函式
hello("Jack", age: 25) //省略標籤




func cofficeMachine(number n:Int ,_ status :String ,suger :String = " less suger") -> (opt :Int, hotorice:String,cofficeSelect :String, suger :String){

        var cofficeMenu = [Int:String]()
        cofficeMenu[1] = " Latte"
        cofficeMenu[2] = " Mocha"
        cofficeMenu[3] = " Americano"
        return (n, status, cofficeMenu[n]!, suger)
}



let annie = cofficeMachine(number: 1, "ice")
annie.opt // 1
annie.hotorice //ice
annie.cofficeSelect //latte
annie.suger // less suger

let vitoria = cofficeMachine(number: 2, "hot", suger: " 70% suger")
vitoria.opt // 2
vitoria.hotorice //hot
vitoria.cofficeSelect //Mocha
vitoria.suger // 70% suger

let apple = cofficeMachine(number: annie.opt, vitoria.hotorice, suger: vitoria.suger)
apple.opt // 1
apple.hotorice //hot
apple.cofficeSelect // latte
apple.suger // 70% suger




















