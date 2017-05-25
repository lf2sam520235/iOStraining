//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//在前面章節介紹了函式，它是一段執行特定任務的獨立程式碼區塊，而更進階地，Swift 提供了兩個型別語法：類別(class)及結構(structure)，可以讓你將多個相關的函式及值儲存在內，以及更多的特性。(目前你可以稍微把類別與結構認知為進階版、豪華版的函式，後續內容會帶你認識有哪些可以使用的功能。)
//
//類別與結構的比較
//
//類別及結構有很多相同的地方，如下：
//屬性(property)：用於儲存值
//方法(method)：用於提供功能
//下標(subscript)：用於存取值
//建構器(initializer)：用於生成初始化值
//擴展(extension)：增加預設實作的功能
//協定(protocol)：對某類別提供標準功能
//與結構相比，類別還有以下的其他功能：
//繼承(inherit)：類別可以繼承另一個類別的內容
//解構器(deinitializer)允許一個類別實體釋放任何其所被分配的資源
//型別轉換允許在執行時檢查和轉換一個類別實體的型別
//參考計數允許對一個類別實體的多次參考
//以上這些特性，會在後面章節陸續介紹。
//定義一個類別及結構分別要使用class及struct關鍵字，並接著一組大括號{}，格式如下：
//class 類別名稱 {
//    類別內的屬性、方法及其他可以定義在內的特性
//}
//
//struct 結構名稱 {
//    結構內的屬性、方法及其他可以定義在內的特性
//}


struct CharacterStats {
    var hp = 0.0
    var mp = 0.0
}

class GameCharacter {
    var stats = CharacterStats()
    var attackSpeed = 1.0
    var name: String?
}


//上述程式中，定義了一個名為CharacterStats的結構來描述一個遊戲角色的狀態，這個結構包含了兩個屬性(屬性即為儲存在類別或結構內的常數或變數)：hp跟mp，分別表示角色血量與法力的最大值。當這兩個屬性被初始化為0.0時，會被自動推斷為Double型別。
//接著定義了一個名為GameCharacter的類別，描述一個遊戲角色的基本資訊，這個類別包含了三個屬性，第一個為角色的狀態，會被初始化為一個CharacterStats結構的實體，其後兩個屬性為攻速及名字，攻速有預設值1.0，名字則為一個可選型別String?，會被自動指派為一個預設值nil，表示一開始沒有name值。



//實體有些地方會翻譯成實例，同樣都是指instance。
//類別與結構都使用建構器語法來生成實體，建構器最簡單的形式就是在類別或結構名稱後面加上一個小括號()語法，這種方式建立的實體，其內的屬性都會被初始化為預設值，如下：
let someStats = CharacterStats()
let someGameCharacter = GameCharacter()
//上述程式中，someStats就是一個CharacterStats結構的實體，someGameCharacter則為一個GameCharacter類別的實體。
//後面章節會正式介紹初始化時使用的建構器。
//可以看到生成實體的方式與呼叫函式相似，所以習慣上兩種命名方式會不一樣，一個使用大駝峰式命名法，另一個使用小駝峰式命名法，來作區別。

//取得屬性
//
//使用點語法(dot syntax)可以取得實體的屬性(property)。規則為實體名稱後加上一個點號.，然後緊接著屬性名稱，如下：
// 這邊使用前面定義的 CharacterStats 結構 及生成的實體 someStats
// 因為沒有初始值 所以會使用預設值 這邊會印出：someStats 血量最大值為0.0
print("someStats 血量最大值為\(someStats.hp)")
//你可以連結多個點語法，直接取得子屬性，像是someGameCharacter中stats屬性的hp屬性，如下：
// 這邊使用前面定義的 GameCharacter 類別
// 及其生成的實體 someGameCharacter
// 印出：血量最大值為0.0
print("血量最大值為\(someGameCharacter.stats.hp)")


//也可以將新的值指派給實體的屬性，如下：
// 將 someGameCharacter 的血量最大值指派為 500
someGameCharacter.stats.hp = 500
// 再次印出 即會變成：500.0
print(someGameCharacter.stats.hp)

//結構型別的成員逐一建構器
//
//所有結構都有一個自動生成的成員逐一建構器(memberwise initializer)，當要生成一個結構的實體時，用來初始化實體內的屬性，如下：
// 這邊使用前面定義的 CharacterStats 結構 生成新的實體 someoneStats
let someoneStats = CharacterStats(hp: 120, mp: 100)

// 印出：120.0
print(someoneStats.hp)
//類別實體沒有成員逐一建構器這個功能。


//值型別與參考型別
//
//Swift 中以記憶體配置的方式不同來說，可以分為值型別(value type)與參考型別(reference type)。值型別會儲存實際的值，而參考型別只是儲存其在記憶體空間中配置的位置。
//結構和列舉是值型別
//
//值型別(value type)在被指派給一個變數、常數或被傳遞給一個函式時，實際上操作的是其拷貝(copy)。指派或傳遞後，兩者的值即各自獨立，不會互相影響。
//在前面章節中，其實已經大量使用了值型別。實際上，在 Swift 中，所有的基本型別：整數、浮點數、布林值、字串、陣列和字典，都是值型別，並且背後都是以結構的形式實作。
//結構和列舉也都是值型別，代表它們的實體及其內任何值型別的屬性，在被指派或傳遞時都會被複製。例子如下：
// 這邊使用前面定義的 CharacterStats 結構
var oneStats = CharacterStats(hp: 120, mp: 100)
var anotherStats = oneStats

// 這時修改 anotherStats 的 hp 屬性
anotherStats.hp = 300
// 可以看出來已經改變了 印出：300.0
print(anotherStats.hp)

// 但 oneStats 的屬性不會改變
// 仍然是被生成實體時的初始值 印出：120.0
print(oneStats.hp)

//在oneStats被指派給anotherStats時，其實是將oneStats內的值進行拷貝(copy)，接著將拷貝的資料儲存給新的實體anotherStats，兩者是完全獨立的實體，彼此不會互相影響。


//類別是參考型別
//
//與值型別不同，參考型別(reference type)在被指派給一個變數、常數或被傳遞給一個函式時，操作的不是其拷貝，而是已存在的實體本身。例子如下：
// 這邊使用前面定義的 GameCharacter 類別
let archer = GameCharacter()
archer.attackSpeed = 1.5
archer.name = "弓箭手"

// 指派給一個新的常數
let superArcher = archer
// 並修改這個新實體的屬性 attackSpeed
superArcher.attackSpeed = 1.8

// 可以看到這邊印出的都為：1.8
print("archer 的攻速為 \(archer.attackSpeed)")
print("superArcher 的攻速為 \(superArcher.attackSpeed)")
// var 拷貝值，let 取代值。

//恆等運算子
//
//因為類別是參考型別，可能有多個常數和變數在後台同時參考某一個類別實體，所以 Swift 提供了兩個恆等運算子，能夠判斷兩個變數或常數是不是參考同一個類別實體：
//等價於 ===
//不等價於 !==
//以下是一個例子：
// 使用前面宣告的兩個常數 archer 與 superArcher
if archer === superArcher {
    print("沒錯！！！是同一個類別實體")
}

//Hint

//請注意===與==的不同
//等價於(===)為判斷兩個變數或常數是不是參考同一個類別實體
//等於(==)為判斷兩個值是否相等


//選擇使用類別或結構
//
//類別與結構有很多相似的地方，要如何決定每個資料建構要定義為類別還是結構，可以參考以下原則：

//需要封裝的資料量較少且較簡單。
//在指派或傳遞這個實體時，有特別需求這個資料是會被拷貝而不是參考。
//不需要去繼承另一個已存在型別的屬性或行為。


//如果符合上述一條或以上原則，則建議定義為結構，其餘則是定義為類別。
//所以實際上，大部分的自定義資料建構都應該使用類別。







