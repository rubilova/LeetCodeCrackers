import UIKit

var greeting = "Partition Equal Subset Sum"

func canPartitionWithMemo(_ nums: [Int]) -> Bool {
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

func canPartition(_ nums: [Int]) -> Bool {
    let total = nums.reduce(0, +)
    
    // If total is odd, it can't be equally divided
    if total % 2 != 0 {
        return false
    }
    
    let target = total / 2
    var dp = [Bool](repeating: false, count: target + 1)
    dp[0] = true  // Base case: zero sum is always possible

    for num in nums {
        // Traverse backwards to avoid overwriting results we still need
        for i in stride(from: target, through: num, by: -1) {
            dp[i] = dp[i] || dp[i - num]
        }
    }

    return dp[target]
}

let nums = [1, 5, 11, 5]
let result = canPartition(nums)
