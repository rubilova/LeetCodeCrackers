//
//  GreatestCommonDivisor.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 12/4/24.
//

import SwiftUI

class GreatestCommonDivisor {
    
    static func findGCD(num1: Int, num2: Int) -> Int {
       var x = 0
       // Finding maximum number
       var y: Int = max(num1, num2)
       // Finding minimum number
       var z: Int = min(num1, num2)
       while z != 0 {
          x = y
          y = z
          z = x % y
       }
       return y
    }
    
    static func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        var subString = ""
        if str1.appending(str2) != str2.appending(str1) {
            return subString
        } else {
            var x = 0
            // Finding maximum number
            var gcd: Int = max(str1.count, str2.count)
            // Finding minimum number
            var z: Int = min(str1.count, str2.count)
            while z != 0 {
               x = gcd
               gcd = z
               z = x % gcd
            }
            
            let lowerBound = String.Index.init(encodedOffset: 0)
            let upperBound = String.Index.init(encodedOffset: gcd)
            subString = String(str1[lowerBound..<upperBound])
            return subString
        }
    }
        
    
    
}

struct GCDView: View {
    let str1: String = "ababab"
    let str2: String = "abab"
    var body: some View {
        VStack {
            Text("Greatest Common Divisor: \(str1), \(str2)")
            Text(GreatestCommonDivisor.gcdOfStrings(str1, str2))
        }
    }
}

#Preview {
    GCDView()
}

