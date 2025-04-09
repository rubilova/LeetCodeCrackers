import UIKit

var greeting = "Integer to Roman"

func intToRoman(_ num: Int) -> String {
    let romanMap: [Int: String] = [
        1000: "M",
        900:  "CM",
        500:  "D",
        400:  "CD",
        100:  "C",
        90:   "XC",
        50:   "L",
        40:   "XL",
        10:   "X",
        9:    "IX",
        5:    "V",
        4:    "IV",
        1:    "I"
    ]
    var result = ""
    var number = num
    
    // Sort keys in descending order for proper conversion
    let sortedKeys = romanMap.keys.sorted(by: >)
    for key in sortedKeys {
        while number >= key {
            result += romanMap[key]!
            number -= key
        }
    }
    
    return result
}

let result1 = intToRoman(3749)
let result2 = intToRoman(58)
let result3 = intToRoman(1994)
