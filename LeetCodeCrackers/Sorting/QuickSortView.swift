//
//  QuickSortView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 4/3/25.
//

import SwiftUI

struct QuickSortView: View {
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
            sortedArray = quickSort(array)
        }
    }
    
    func quickSort(_ arr: [Int]) -> [Int] {
        guard arr.count > 1 else { return arr } // Base case
        
        let pivot = arr[arr.count / 2] // Choose a pivot
        let left = arr.filter { $0 < pivot }   // Elements less than pivot
        let middle = arr.filter { $0 == pivot } // Elements equal to pivot
        let right = arr.filter { $0 > pivot }   // Elements greater than pivot
        
        return quickSort(left) + middle + quickSort(right) // Recursively sort and merge
    }
}

#Preview {
    QuickSortView()
}
