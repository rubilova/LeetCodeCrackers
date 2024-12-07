//
//  KidsWithCandiesView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 12/6/24.
//

import SwiftUI

struct KidsWithCandiesView: View {
    var result: [Bool] {
        kidsWithCandies([2, 3, 5, 1, 3], 3)
    }
    var body: some View {
        Text(result.map({"\($0)"}).joined(separator: ", "))
    }
    
    
}

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var result: [Bool] = []
    let maxCandies = candies.max()!
    for candy in candies {
        if candy + extraCandies >= maxCandies {
            result.append(true)
        } else {
            result.append(false)
        }
    }
    return result
}

#Preview {
    KidsWithCandiesView()
}


