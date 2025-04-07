//
//  OddEvenLinkedListView.swift
//  LeetCodeCrackers
//
//  Created by Elena Rubilova on 4/3/25.
//

import SwiftUI

class Node<T> {
    
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool { head == nil }
    
    mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func reorderOddEven() {
        guard head != nil, head?.next != nil else { return }
        
        var odd = head
        let evenHead = head?.next
        var even = evenHead
        
        while even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            
            even?.next = odd?.next
            even = even?.next
        }
        
        odd?.next = evenHead
    }
    
    public var print: String {
        var stringArray = "["
        guard var node = head else {
            Swift.print(stringArray + "]")
            return stringArray + "]" }
        while let next = node.next {
            stringArray += "\(node.value), "
            node = next
        }
        stringArray += "\(node.value)"
        Swift.print(stringArray + "]")
        return stringArray + "]"
    }
}

struct OddEvenLinkedListView: View {
    @State var linkedList = LinkedList<Any>()
    
    var body: some View {
        VStack {
            Text("1 -> 3 -> 5 -> 7 -> 9")
            Text(linkedList.print)
        }.onAppear {
            linkedList.push(9)
            linkedList.push(7)
            linkedList.push(5)
            linkedList.push(3)
            linkedList.push(1)
            linkedList.reorderOddEven()
        }
    }
    
    
}

#Preview {
    OddEvenLinkedListView()
}
