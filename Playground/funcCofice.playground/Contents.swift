//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




class CofficeShop {
    
    
    func cofficeMachine(number n:Int ,_ status :String ,cofficesuger :String = " less suger") -> (opt :Int, hotorice:String,cofficeSelect :String, cofficesuger :String){
        var cofficeMenu = [Int:String]()
        cofficeMenu[1] = " Latte"
        cofficeMenu[2] = " Mocha"
        cofficeMenu[3] = " Americano"
        return (n, status, cofficeMenu[n]!, cofficesuger)
    }
    
    func beverageMachine(_ number: Int, _ status: String, _ beveragesuger :String = " 50% suger") -> (opt :Int, hotorice:String,cofficeSelect :String, beveragesuger :String){
        var beverageMeun = [Int:String]()
        beverageMeun[1] = "black tea"
        beverageMeun[2] = "green tea"
        beverageMeun[3] = "coke"
        return (number , status , beverageMeun[number]! , beveragesuger)
    }
    

    
    
}
class CofficeShopList: CofficeShop{
    var annie:Array<Any> = []
}
CofficeShopList().annie.append(CofficeShopList().cofficeMachine(number: 1, "ice"))
CofficeShopList().annie


//let annie = CofficeShop().cofficeMachine(number: 1, "ice")
//annie.opt // 1
//annie.hotorice //ice
//annie.cofficeSelect //latte
//annie.cofficesuger // less suger
//
//let vitoria = CofficeShop().cofficeMachine(number: 2, "hot", cofficesuger: " 70% suger")
//vitoria.opt // 2
//vitoria.hotorice //hot
//vitoria.cofficeSelect //Mocha
//vitoria.cofficesuger // 70% suger
//
//let apple = CofficeShop().cofficeMachine(number: annie.opt, vitoria.hotorice, cofficesuger: vitoria.cofficesuger)
//apple.opt // 1
//apple.hotorice //hot
//apple.cofficeSelect // latte
//apple.cofficesuger // 70% suger
//
//let List = CofficeShop().shopCustomerList()[1]

















