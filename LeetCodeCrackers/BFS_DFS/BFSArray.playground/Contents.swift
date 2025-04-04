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

let root = TreeNode(1,
    TreeNode(2,
        TreeNode(4,
            TreeNode(8),
            TreeNode(9)
        ),
        TreeNode(5,
            TreeNode(10),
            TreeNode(11)
        )
    ),
    TreeNode(3,
        TreeNode(6,
            TreeNode(12),
            TreeNode(13)
        ),
        TreeNode(7,
            TreeNode(14),
            TreeNode(15)
        )
    )
)

var queue: [(TreeNode, Int)] = [(root, root.val)]
var visited: [Int] = []
while !queue.isEmpty {
    let (node, value) = queue.removeFirst()
    visited.append(value)
    if let leftChild = node.left {
        queue.append((leftChild, leftChild.val))
    }
    if let rightChild = node.right {
        queue.append((rightChild, rightChild.val))
    }
}

var greeting = "Find an array of all values in a binary tree using BFS"
let result = visited

