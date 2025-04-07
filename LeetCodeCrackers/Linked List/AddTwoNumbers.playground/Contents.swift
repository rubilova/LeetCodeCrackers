import UIKit

var greeting = "Add Two Numbers (Linked lists)"

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    static func printList(_ head: ListNode?) {
        var current = head
        var output = ""
        while current != nil {
            output += "\(current!.val)"
            if current!.next != nil {
                output += " -> "
            }
            current = current!.next
        }
        print(output)
    }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummyHead = ListNode(0)
    var current = dummyHead
    var carry = 0
    var node1 = l1
    var node2 = l2
    while node1 != nil || node2 != nil || carry != 0
    {
        let val1 = node1?.val ?? 0
        let val2 = node2?.val ?? 0
        let sum = val1 + val2 + carry
        carry = sum / 10
        let newNode = ListNode(sum % 10)
        current.next = newNode
        // shift to the next digit
        current = current.next!
        node1 = node1?.next
        node2 = node2?.next
    }
    return dummyHead.next
}

var linkedList1 = ListNode(2)
linkedList1.next = ListNode(4)
linkedList1.next?.next = ListNode(3)

var linkedList2 = ListNode(5)
linkedList2.next = ListNode(6)
linkedList2.next?.next = ListNode(4)

let result = addTwoNumbers(linkedList1, linkedList2)
ListNode.printList(result)
