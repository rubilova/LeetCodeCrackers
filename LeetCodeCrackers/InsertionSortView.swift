//
//  InsertionSortView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 4/3/25.
//
import SwiftUI

struct InsertionSortView: View {
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
            sortedArray = insertionSort(array)
        }
    }
    
    func insertionSort(_ arr: [Int]) -> [Int] {
        var sorted = arr  // Create a copy to avoid modifying `array` directly
        for i in 1..<sorted.count {
            let key = sorted[i]
            var j = i - 1
            while j >= 0 && sorted[j] > key {
                sorted[j + 1] = sorted[j]
                j -= 1
            }
            sorted[j + 1] = key
        }
        return sorted
    }
}

#Preview {
    InsertionSortView()
}
