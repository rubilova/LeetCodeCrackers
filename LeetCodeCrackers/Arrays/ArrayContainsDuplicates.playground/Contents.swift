import UIKit

var greeting = "Check if array contains duplicates"

// not very efficient because of manually inserting elements into a set
func containsDuplicateOne(_ nums: [Int]) -> Bool {
        var distinct: Set<Int> = []
        for num in nums {
            if distinct.contains(num) {
                return true
            } else {
                distinct.insert(num)
            }
        }
        return false
    }
func containsDuplicateTwo(_ nums: [Int]) -> Bool {
    return Set(nums).count < nums.count
}

let array = [1,2,3,1]

let result1 = containsDuplicateOne(array)
let result2 = containsDuplicateTwo(array)
