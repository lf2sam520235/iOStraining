//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//巢狀型別
//
//巢狀型別(nested types)表示在一個列舉、結構或類別中，還可以依照需求在其內，再定義列舉、結構或類別，以下是定義一個撲克牌結構，並內含列舉的例子：
struct Poker {
    
    enum Suit: String {
        case spades = "黑桃", hearts = "紅心"
        case diamonds = "方塊", clubs = "梅花"
    }
    
    enum Rank: Int {
        case two = 2, three, four, five, six
        case seven, eight, nine, ten
        case jack, queen, king, ace
    }
    
    let rank: Rank, suit: Suit
    
    func description () {
        print("這張牌的花色是：\(suit.rawValue)")
        print("點數為：\(rank.rawValue)")
    }
    
}

let poker = Poker(rank: .king, suit: .hearts)

// 印出：這張牌的花色是：紅心，點數為：13
poker.description()


//如果你要在外部使用一個巢狀型別內部的列舉、結構或類別時，可以在其前面直接加上這個巢狀型別的名稱即可，如下：
let diamondsName = Poker.Suit.diamonds

// 印出：方塊
print(diamondsName.rawValue)


