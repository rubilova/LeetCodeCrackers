import UIKit
import Foundation

var greeting = "Breadth First Search"

// Graph represented as an adjacency list
let graph: [String: [String]] = [
    "A": ["B", "C"],
    "B": ["A", "D", "E"],
    "C": ["A", "F"],
    "D": ["B"],
    "E": ["B", "F"],
    "F": ["C", "E"]
]

func bfs(start: String, graph: [String: [String]]) {
    var visited: Set<String> = []
    var queue: [String] = []

    queue.append(start)
    visited.insert(start)

    while !queue.isEmpty {
        let node = queue.removeFirst()
        print("Visited: \(node)")

        for neighbor in graph[node] ?? [] {
            if !visited.contains(neighbor) {
                queue.append(neighbor)
                visited.insert(neighbor)
            }
        }
    }
}

// Run BFS starting from node "A"
bfs(start: "A", graph: graph)

