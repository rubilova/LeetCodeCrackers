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
            VStack(spacing: 10) {
                Text("- Sorting algorithms:")
                    .font(.title)
                navLink(InsertionSortView(), "Insertion Sort")
                navLink(MergeSortView(), "Merge Sort")
                navLink(QuickSortView(), "Quick Sort")
                Text("- Two Pointers")
                    .font(.title)
                navLink(RemoveOccurencesInPlace(), "Remove Occurences in Place")
                Text("- Work with Strings:")
                    .font(.title)
                navLink(MergeStringsView(), "Merge Strings")
                navLink(GCDView(), "Greatest Common Divisor")
                Text("- Work with Arrays:")
                    .font(.title)
                navLink(BinarySearchView(), "Binary Search")
                navLink(KidsWithCandiesView(), "Kids With Candies")
                navLink(DifferenceOfTwoArrays(), "Difference of Two Arrays")
                navLink(MoveZeroesView(), "Move Zeroes")
                Text("- Linked List:")
                    .font(.title)
                navLink(OddEvenLinkedListView(), "Odd Even Linked List")
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
