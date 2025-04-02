//
//  MoveZeroesView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 4/2/25.
//

import SwiftUI

struct MoveZeroesView: View {
    @State private var nums: [Int] = [0, 1, 0, 3, 12]
    
    var body: some View {
        VStack {
            Text(nums.description)
        }.onAppear {
            moveZeroes()
        }
    }
    
    func moveZeroes() {
        var nonZeroIndex = 0
        // Move all non-zero elements to the beginning
        for num in nums {
            if num != 0 {
                nums[nonZeroIndex] = num
                nonZeroIndex += 1
            }
        }
        // Fill the rest with zeroes
        for i in nonZeroIndex..<nums.count {
            nums[i] = 0
        }
    }
}

#Preview {
    MoveZeroesView()
}
