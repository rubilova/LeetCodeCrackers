import UIKit

var greeting = "Move zeroes to the end of array in place"
var nums: [Int] = [0, 1, 0, 3, 12]

var k = 0 // last valid index with non-zero element
var zeroIndex = nums.count - 1
for i in 0..<nums.count {
    if nums[i] != 0 {
        // shift non-zero element to last valid index
        nums[k] = nums[i]
        
        k += 1
    }
}
// Second pass: fill the rest with zeros
for i in k..<nums.count {
    nums[i] = 0
}
let result = nums
