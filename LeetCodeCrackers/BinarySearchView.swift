//
//  BinarySearchView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 4/3/25.
//

import SwiftUI

struct BinarySearchView: View {
    @State var array = [5,8,2,3,7,8,1,3,2,5,95,4,3,8,0,4]
    let num = 8
    var body: some View {
        VStack(spacing: 10) {
            Text("Array: \(array.description)")
                
            Text("Find position of \(num)?")
            Text("\(binarySearch(array, num))")
                
        }
        .onAppear {
            array.sort()
        }
    }
    
    func binarySearch(_ arr:[Int], _ num: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        while(left <= right) {
            let middle = left + (right - left) / 2
            if(arr[middle] == num) {
                return middle
            } else if(arr[middle] > num) {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        return -1
    }
}

#Preview {
    BinarySearchView()
}
