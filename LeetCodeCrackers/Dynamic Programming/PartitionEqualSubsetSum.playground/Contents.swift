import UIKit

var greeting = "Partition Equal Subset Sum"

func canPartition(_ nums: [Int]) -> Bool {
    let total = nums.reduce(0, +)
    if total % 2 == 1 {
        return false
    }
    let target = total / 2
    var memo = [String: Bool]() // Memoization dictionary
    
    // Helper recursive function
    func dfs(_ index: Int, _ currentSum: Int) -> Bool {
        // If we reach the target, we found a valid subset
        if currentSum == target {
            return true
        }
        // If we exceed the target or reach the end of array, stop
        if currentSum > target || index == nums.count {
            return false
        }
        
        // Memoization key
        let key = "\(index)-\(currentSum)"
        if let cached = memo[key] {
            return cached
        }
        
        // Try including nums[index]
        let include = dfs(index + 1, currentSum + nums[index])
        // Try excluding nums[index]
        let exclude = dfs(index + 1, currentSum)
        
        // Store result in memo
        memo[key] = include || exclude
        return memo[key]!
    }
    // Start from index 0 and currentSum 0
    return dfs(0, 0)
}

let nums = [1, 5, 11, 5]
let result = canPartition(nums)
