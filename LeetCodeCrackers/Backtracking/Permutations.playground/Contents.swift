import UIKit

func permuteClean(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var path = [Int]()
    var used = Array(repeating: false, count: nums.count)

    func backtrack() {
        if path.count == nums.count {
            result.append(path)
            return
        }
        
        for i in 0..<nums.count {
            if used[i] { continue }
            
            path.append(nums[i])
            used[i] = true
            backtrack()
            path.removeLast()
            used[i] = false
        }
    }

    backtrack()
    return result
}

var greeting = "Return all permutations"
func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var path = [Int]()
    var used = Array(repeating: false, count: nums.count)

    func backtrack(level: Int = 0) {
        print(String(repeating: "  ", count: level) + "→ Enter: path = \(path)")
        
        if path.count == nums.count {
            print(String(repeating: "  ", count: level) + "✅ Complete: \(path)")
            result.append(path)
            return
        }

        for i in 0..<nums.count {
            if used[i] {
                print(String(repeating: "  ", count: level) + "⛔️ Skip: nums[\(i)] = \(nums[i]) already used")
                continue
            }

            print(String(repeating: "  ", count: level) + "🔹 Choose: nums[\(i)] = \(nums[i])")
            path.append(nums[i])
            used[i] = true

            backtrack(level: level + 1)

            print(String(repeating: "  ", count: level) + "↩️ Backtrack: Remove \(path.last!)")
            path.removeLast()
            used[i] = false
        }

        print(String(repeating: "  ", count: level) + "← Exit: path = \(path)")
    }

    backtrack()
    return result
}


let array = [1,2,3]
let result = permute(array)
