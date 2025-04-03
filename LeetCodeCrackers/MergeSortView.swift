//
//  MergeSortView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 4/3/25.
//

import SwiftUI

struct MergeSortView: View {
    @State var array = [5,8,2,3,7,1,3,2,5,95,4,3,0,4]
    @State private var sortedArray: [Int] = []
    
    var body: some View {
        VStack {
            Text("Unsorted Array: \(array.description)")
                .padding()
            Text("Sorted Array: \(sortedArray.description)")
                .padding()
        }
        .onAppear {
            sortedArray = mergeSort(array)
        }
    }
    
    func mergeSort(_ arr: [Int]) -> [Int] {
        guard arr.count > 1 else { return arr }
        let mid = arr.count / 2
        let left = mergeSort(Array(arr[..<mid]))
        let right = mergeSort(Array(arr[mid...]))
        return merge(left, right)
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var result = [Int](), l = 0, r = 0
        while l < left.count && r < right.count {
            if left[l] < right[r] {
                result.append(left[l])
                l += 1
            } else {
                result.append(right[r])
                r += 1
            }
        }
        return result + left[l...] + right[r...]
    }
}

#Preview {
    MergeSortView()
}


