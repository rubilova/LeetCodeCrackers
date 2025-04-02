//
//  ContentView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                navLink(MergeStringsView(), "Merge Strings")
                navLink(GCDView(), "Greatest Common Divisor")
                navLink(KidsWithCandiesView(), "Kids With Candies")
                navLink(DifferenceOfTwoArrays(), "Difference of Two Arrays")
            }
            .navigationTitle("LeetCode Crackers 🍪")
        }
    }
    
    private func navLink(_ destination: some View, _ text: String) -> some View {
        NavigationLink {
            destination
        } label: {
            Text(text).font(.title)
        }
    }
}

#Preview {
    ContentView()
}
