//
//  RemoveOccurencesInPlace.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 4/4/25.
//

import SwiftUI

struct RemoveOccurencesInPlace: View {
        @State private var numbers = [3, 2, 2, 3, 4, 2, 5]
        @State private var valueToRemove = 2
        @State private var resultCount = 0

        var body: some View {
            VStack(spacing: 16) {
                Text("Original Array:")
                Text("\(numbers.map(String.init).joined(separator: ", "))")
                    .font(.headline)

                HStack {
                    Text("Value to remove:")
                    TextField("Enter value", value: $valueToRemove, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 100)
                }

                Button("Remove Element") {
                    var copy = numbers
                    resultCount = removeElement(&copy, valueToRemove)
                    numbers = Array(copy.prefix(resultCount)) // update the array with only valid elements
                }

                Text("Array after removal:")
                Text("\(numbers.map(String.init).joined(separator: ", "))")
                    .font(.headline)

                Text("Remaining elements count: \(resultCount)")
            }
            .padding()
        }

        // Function with inout parameter
        func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
            var k = 0  // index for the next valid element
            
            for i in 0..<nums.count {
                if nums[i] != val {
                    nums[k] = nums[i]
                    k += 1
                }
            }
            
            return k
        }
    }


#Preview {
    RemoveOccurencesInPlace()
}
