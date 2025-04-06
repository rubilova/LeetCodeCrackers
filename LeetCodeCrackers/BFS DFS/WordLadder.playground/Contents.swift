import UIKit

var greeting = "Word ladder"

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    let wordSet = Set(wordList)
    guard wordSet.contains(endWord) else { return 0 }
    
    var beginSet: Set<String> = [beginWord]
    var endSet: Set<String> = [endWord]
    var visited: Set<String> = [beginWord, endWord]
    var level = 1
    
    while !beginSet.isEmpty && !endSet.isEmpty {
        // Always expand the smaller set to reduce complexity
        if beginSet.count > endSet.count {
            swap(&beginSet, &endSet)
        }
        
        var nextLevelSet: Set<String> = []
        
        for word in beginSet {
            var wordArray = Array(word)
            for i in 0..<wordArray.count {
                let originalChar = wordArray[i]
                for c in "abcdefghijklmnopqrstuvwxyz" {
                    wordArray[i] = c
                    let newWord = String(wordArray)
                    
                    if endSet.contains(newWord) {
                        return level + 1
                    }
                    
                    if wordSet.contains(newWord), !visited.contains(newWord) {
                        visited.insert(newWord)
                        nextLevelSet.insert(newWord)
                    }
                }
                wordArray[i] = originalChar
            }
        }
        
        beginSet = nextLevelSet
        level += 1
    }
    
    return 0
}

let result = ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
