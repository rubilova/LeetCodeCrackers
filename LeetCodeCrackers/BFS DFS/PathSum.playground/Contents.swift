import UIKit
import Foundation

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
let root = [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]
var greeting = "Check if a tree has a path with a target sum"

let tree = buildTree(root)
func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else { return false }
    
    // Queue holds tuples of (currentNode, currentSum)
    var queue: [(TreeNode, Int)] = [(root, root.val)]
    
    while !queue.isEmpty {
        let (node, currentSum) = queue.removeFirst()
        
        // Check if it's a leaf node and the sum equals target
        if node.left == nil && node.right == nil && currentSum == targetSum {
            return true
        }
        
        if let left = node.left {
            queue.append((left, currentSum + left.val))
        }
        if let right = node.right {
            queue.append((right, currentSum + right.val))
        }
    }
    return false
}

let targetSum = 22
let result = hasPathSum(tree, targetSum)
