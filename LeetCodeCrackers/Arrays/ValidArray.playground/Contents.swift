import UIKit

var greeting = "Minimum Operations to Make Array Values Equal to K"

func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        if nums.reduce(Int.max, { min($0, $1) }) <= k {
            return -1
        }
    return result
}
