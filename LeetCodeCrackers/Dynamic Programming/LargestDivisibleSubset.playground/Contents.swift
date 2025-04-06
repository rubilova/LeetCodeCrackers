import UIKit

var greeting = "Largest divisible subset"

func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
    if nums.isEmpty { return [] }
    
    let nums = nums.sorted()
    var dp = Array(repeating: 1, count: nums.count)
    var prev = Array(repeating: -1, count: nums.count)
    
    var maxIndex = 0
    
    for i in 1..<nums.count {
        for j in 0..<i {
            if nums[i] % nums[j] == 0 && dp[j] + 1 > dp[i] {
                dp[i] = dp[j] + 1
                prev[i] = j
            }
        }
        if dp[i] > dp[maxIndex] {
            maxIndex = i
        }
    }
    
    // Reconstruct the subset
    var result = [Int]()
    var current = maxIndex
    while current >= 0 {
        result.append(nums[current])
        current = prev[current]
    }
    
    return result.reversed()
}

let array1 = largestDivisibleSubset([1,2,3])
let array2 = largestDivisibleSubset([1,2,4,8])
let array3 = largestDivisibleSubset([3,4,16,8])
