//
//  DifferenceOfTwoArrays.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 4/2/25.
//
import SwiftUI

struct DifferenceOfTwoArrays: View {
    var body: some View {
        let result = findDifference([1,2,3], [2,4,6])
        Text("Difference of two arrays: ")
        Text(result.description)
    }
    
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let set1 = Set(nums1)
        let set2 = Set(nums2)
        let diff1 = set1.subtracting(set2)
        let diff2 = set2.subtracting(set1)
        return [Array(diff1), Array(diff2)]
    }
}

#Preview {
    DifferenceOfTwoArrays()
}
