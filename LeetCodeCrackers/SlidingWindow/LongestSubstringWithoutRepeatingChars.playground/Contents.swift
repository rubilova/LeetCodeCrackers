import UIKit

var greeting = "Longest substring without repeating characters (Sliding Window)"

func longestSubstring(str: String) -> Int {
    var maxLength = 0
    if str.isEmpty { return maxLength }
    var left = str.startIndex
    var right = str.startIndex
    var substring: Set<Character> = []
    
    while right < str.endIndex {
        let char = str[right]
        // if we can insert character then increase index
        if !substring.contains(char) {
            substring.insert(char)
            maxLength = max(maxLength, str.distance(from: left, to: right) + 1)
            right = str.index(after: right)
        } else {
            substring.remove(str[left])
            left = str.index(after: left)
        }
        print(substring)
    }
    return maxLength
}

let output = longestSubstring(str: "abcabcbb")
