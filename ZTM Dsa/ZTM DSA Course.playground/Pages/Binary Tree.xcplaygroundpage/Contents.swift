import Foundation

// MARK: - Binary Tree Implementation
class Node<T> {
    var value: T
    var leftNode: Node<T>?
    var rightNode: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

