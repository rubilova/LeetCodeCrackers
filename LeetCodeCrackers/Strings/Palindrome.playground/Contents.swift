import UIKit

var greeting = "Is given string a palindrome?"

func isPalindrome(_ s: String) -> Bool {
        let str = s.lowercased().filter { $0.isLetter || $0.isNumber }
        guard str.count > 1 else { return true }
        var leftIndex = str.startIndex
        var rightIndex = str.index(before: str.endIndex)
        while leftIndex <= rightIndex {
            if str[leftIndex] != str[rightIndex] {
                return false
            }
            leftIndex = str.index(after: leftIndex)
            rightIndex = str.index(before: rightIndex)
        }
        return true
    }

let result1 = isPalindrome("raceacar")
let result2 = isPalindrome("tacocat")
let result3 = isPalindrome("")
let result4 = isPalindrome(".a")
