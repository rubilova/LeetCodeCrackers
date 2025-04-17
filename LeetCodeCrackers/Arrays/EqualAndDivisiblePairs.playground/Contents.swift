import UIKit

var greeting = "Count Equal and Divisible Pairs in an Array"
// Given a 0-indexed integer array nums of length n and an integer k, return the number of pairs (i, j) where 0 <= i < j < n, such that nums[i] == nums[j] and (i * j) is divisible by k.

func countPairs(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    let n = nums.count
    for i in 0..<n {
        for j in (i+1)..<n {
            if nums[i] == nums[j] && (i * j) % k == 0 {
                result += 1
            }
        }
    }
    
    return result
}
