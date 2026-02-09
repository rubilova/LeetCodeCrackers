import SwiftUI

final class TreeNode: ObservableObject {
    var val: Int
    @Published var left: TreeNode?
    @Published var right: TreeNode?
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

struct BalanceBSTView: View {
    @State private var originalRoot: TreeNode = {
        // Create an unbalanced BST: 1 -> 2 -> 3 -> 4 -> 5 (right-skewed)
        let root = TreeNode(1)
        root.right = TreeNode(2)
        root.right?.right = TreeNode(3)
        root.right?.right?.right = TreeNode(4)
        root.right?.right?.right?.right = TreeNode(5)
        return root
    }()
    @State private var balancedRoot: TreeNode?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Balance a Binary Search Tree")
                    .font(.largeTitle)

                Text("We balance a BST by performing an inorder traversal to get a sorted array, then build a height-balanced BST from the sorted values using divide-and-conquer (pick middle as root).")

                Button("Balance Tree") {
                    balancedRoot = balanceBST(originalRoot)
                }
                .buttonStyle(.borderedProminent)

                Group {
                    Text("Original (level-order)").font(.title2)
                    levelOrderView(for: originalRoot)
                }

                if let balancedRoot {
                    Group {
                        Text("Balanced (level-order)").font(.title2)
                        levelOrderView(for: balancedRoot)
                    }
                }

                Divider()
                Text("Algorithm")
                    .font(.title2)
                Text("1. Inorder traversal to collect sorted values.\n2. Recursively build a balanced BST from the sorted array by picking the middle element as root, and building left and right subtrees from the left and right halves.")
                .font(.callout)
                .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle("Balance BST")
    }

    // MARK: - Algorithm
    private func balanceBST(_ root: TreeNode?) -> TreeNode? {
        let values = inorder(root)
        return buildBalanced(values)
    }

    private func inorder(_ node: TreeNode?) -> [Int] {
        guard let node = node else { return [] }
        return inorder(node.left) + [node.val] + inorder(node.right)
    }

    private func buildBalanced(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        let mid = nums.count / 2
        let root = TreeNode(nums[mid])
        let leftArray = Array(nums[..<mid])
        let rightArray = Array(nums[(mid+1)...])
        root.left = buildBalanced(leftArray)
        root.right = buildBalanced(rightArray)
        return root
    }

    // MARK: - Visualization helpers
    private func levelOrderView(for root: TreeNode?) -> some View {
        let levels = levelOrder(root)
        return VStack(alignment: .leading, spacing: 8) {
            ForEach(levels.indices, id: \.self) { i in
                HStack(spacing: 8) {
                    Text("Level \(i):")
                        .font(.headline)
                    ForEach(levels[i], id: \.self) { v in
                        Text("\(v)")
                            .padding(6)
                            .background(Capsule().fill(Color.blue.opacity(0.15)))
                    }
                }
            }
        }
    }

    private func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result: [[Int]] = []
        var queue: [TreeNode] = [root]
        while !queue.isEmpty {
            let count = queue.count
            var level: [Int] = []
            for _ in 0..<count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let l = node.left { queue.append(l) }
                if let r = node.right { queue.append(r) }
            }
            result.append(level)
        }
        return result
    }
}

#Preview {
    NavigationStack {
        BalanceBSTView()
    }
}
