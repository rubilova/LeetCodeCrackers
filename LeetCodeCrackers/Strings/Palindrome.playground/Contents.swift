import UIKit

var greeting = "Is given string a palindrome?"

func isPalindrome(_ str: String) -> Bool {
    var startIndex = str.index(str.startIndex, offsetBy: 0)
    var endIndex = str.index(before: str.endIndex)
    while startIndex <= endIndex {
        
        if str[startIndex] != str[endIndex] {
            return false
        }
        startIndex = str.index(after: startIndex)
        endIndex = str.index(before: endIndex)
    }
    return true
}

let result1 = isPalindrome("raceacar")
let result2 = isPalindrome("tacocat")
