//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

var constantString = "Highlander"
constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified

for character in "Dog!🐶".characters {  //分解字串
        print(character)
}
// D
// o
// g
// !
// 🐶


let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"] //合併字串
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"

//字碼查詢
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// 68 111 103 226 128 188 240 159 144 182
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶

let string1 = "hello"

let string2 = " there"

var welcome = string1 + string2

// welcome now equals "hello there"



var instruction = "look over"

instruction += string2

// instruction now equals "look over there"



let exclamationMark: Character = "!"

welcome.append(exclamationMark)

// welcome now equals "hello there!"



let multiplier = 3

let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// message is "3 times 2.5 is 7.5"


let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"

// "Imagination is more important than knowledge" - Einstein

let dollarSign = "\u{24}" // $, Unicode scalar U+0024

let blackHeart = "\u{2665}" // ♥, Unicode scalar U+2665

let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496


let eAcute: Character = "\u{E9}" // é

let combinedEAcute: Character = "\u{65}\u{301}" // e followed by ́

// eAcute is é, combinedEAcute is é


let precomposed: Character = "\u{D55C}" // 한

let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ

// precomposed is 한, decomposed is 한


let enclosedEAcute: Character = "\u{E9}\u{20DD}"

// enclosedEAcute is é⃝


let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

// regionalIndicatorForUS is 🇺🇸



let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"

print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

// Prints "unusualMenagerie has 40 characters"




var word = "cafe"

print("the number of characters in \(word) is \(word.characters.count)")

// Prints "the number of characters in cafe is 4"

word += "\u{301}" // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")

// Prints "the number of characters in café is 4"



//尋找字串位子
let greeting = "Guten Tag!"

greeting[greeting.startIndex]

// G

greeting[greeting.index(before: greeting.endIndex)]

// !

greeting[greeting.index(after: greeting.startIndex)]

// u

let index = greeting.index(greeting.startIndex, offsetBy: 7)

greeting[index]

// a




for index in greeting.characters.indices {
    
    print("\(greeting[index]) ", terminator: "")
    
}

// Prints "G u t e n T a g ! "





welcome.insert("!", at: welcome.endIndex)

// welcome now equals "hello!"

welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))

// welcome now equals "hello there!"



welcome.remove(at: welcome.index(before: welcome.endIndex))

// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex

welcome.removeSubrange(range)

// welcome now equals "hello"


//字串相等判斷
let quotation = "We're a lot alike, you and I."

let sameQuotation = "We're a lot alike, you and I."

if quotation == sameQuotation {
    
    print("These two strings are considered equal")
    
}

// Prints "These two strings are considered equal"


//字串部分符合前驟
let romeoAndJuliet = [
    
    "Act 1 Scene 1: Verona, A public place",
    
    "Act 1 Scene 2: Capulet's mansion",
    
    "Act 1 Scene 3: A room in Capulet's mansion",
    
    "Act 1 Scene 4: A street outside Capulet's mansion",
    
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    
    "Act 2 Scene 1: Outside Capulet's mansion",
    
    "Act 2 Scene 2: Capulet's orchard",
    
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    
    "Act 2 Scene 4: A street in Verona",
    
    "Act 2 Scene 5: Capulet's mansion",
    
    "Act 2 Scene 6: Friar Lawrence's cell"]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    
    if scene.hasPrefix("Act 1 ") {
        
        act1SceneCount += 1
        
    }
    
}

print("There are \(act1SceneCount) scenes in Act 1")

// Prints "There are 5 scenes in Act 1"



//字串符合後驟
var mansionCount = 0

var cellCount = 0

for scene in romeoAndJuliet {
    
    if scene.hasSuffix("Capulet's mansion") {
        
        mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell") {
                cellCount += 1
            }
    }
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

// Prints "6 mansion scenes; 2 cell scenes"



let tring1 = "str\n\rstr"
let tring2 = "str\r\nstr"

tring1.characters.count
tring2.characters.count









