//
//  MergeStringsView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 12/6/24.
//

import SwiftUI

struct MergeStringsView: View {
    var body: some View {
        VStack {
            Text("Merge Strings:").fontWeight(.bold)
            Text(mergeAlternately("Hello", "World"))
        }
    }
}

func mergeAlternately(_ word1: String, _ word2: String) -> String {
    var result: String = ""
    for (a, b) in zip(word1, word2) {
        result.append(a)
        result.append(b)
    }
    if word1.count > word2.count {
        result.append(contentsOf: word1.suffix(word1.count - word2.count))
    }
    if word2.count > word1.count {
        result.append(contentsOf: word2.suffix(word2.count - word1.count))
    }
    
    return result
}

#Preview {
    MergeStringsView()
}
