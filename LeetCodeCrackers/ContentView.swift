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
            List {
                Section("Sorting algorithms") {
                    navLink(InsertionSortView(), "Insertion Sort")
                    navLink(MergeSortView(), "Merge Sort")
                    navLink(QuickSortView(), "Quick Sort")
                }

                Section("Two Pointers") {
                    navLink(RemoveOccurencesInPlace(), "Remove Occurences in Place")
                }

                Section("Work with Strings") {
                    navLink(MergeStringsView(), "Merge Strings")
                    navLink(GCDView(), "Greatest Common Divisor")
                }

                Section("Work with Arrays") {
                    navLink(BinarySearchView(), "Binary Search")
                    navLink(KidsWithCandiesView(), "Kids With Candies")
                    navLink(DifferenceOfTwoArrays(), "Difference of Two Arrays")
                    navLink(MoveZeroesView(), "Move Zeroes")
                }

                Section("Linked List") {
                    navLink(OddEvenLinkedListView(), "Odd Even Linked List")
                }
                
                Section("Binary Tree") {
                    navLink(BalanceBSTView(), "Balance a Binary Search Tree")
                }
            }
            .listStyle(.insetGrouped)
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
