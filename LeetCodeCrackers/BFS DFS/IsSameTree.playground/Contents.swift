import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func buildTree(_ values: [Int?]) -> TreeNode? {
    guard !values.isEmpty, let rootVal = values[0] else { return nil }

    let root = TreeNode(rootVal)
    var queue: [TreeNode] = [root]
    var i = 1

    while i < values.count {
        let current = queue.removeFirst()

        // Left child
        if i < values.count, let leftVal = values[i] {
            let leftNode = TreeNode(leftVal)
            current.left = leftNode
            queue.append(leftNode)
        }
        i += 1

        // Right child
        if i < values.count, let rightVal = values[i] {
            let rightNode = TreeNode(rightVal)
            current.right = rightNode
            queue.append(rightNode)
        }
        i += 1
    }

    return root
}

var greeting = "Is same tree"

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard !(p == nil && q == nil) else { return true }
        guard let proot = p, let qroot = q, proot.val == qroot.val else { return false }
        var pqueue = [proot]
        var qqueue = [qroot]
        while !pqueue.isEmpty && !qqueue.isEmpty {
            let pnode = pqueue.removeFirst()
            let qnode = qqueue.removeFirst()
            // Compare values
            if pnode.val != qnode.val {
                return false
            }

            // Check left children
            if let pLeft = pnode.left, let qLeft = qnode.left {
                pqueue.append(pLeft)
                qqueue.append(qLeft)
            } else if (pnode.left != nil || qnode.left != nil) {
                return false // one has left, the other doesn't
            }

            // Check right children
            if let pRight = pnode.right, let qRight = qnode.right {
                pqueue.append(pRight)
                qqueue.append(qRight)
            } else if (pnode.right != nil || qnode.right != nil) {
                return false // one has right, the other doesn't
            }
        

        }
        return true
    }

let root = [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]
let tree1 = buildTree(root)
let tree2 = buildTree(root)
let result = isSameTree(tree1, tree2)
