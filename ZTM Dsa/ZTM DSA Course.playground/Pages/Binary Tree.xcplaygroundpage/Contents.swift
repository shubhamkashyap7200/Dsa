import Foundation

// MARK: - Binary Tree Implementation
class Node<T> {
    // MARK: - Properties
    var value: T
    var leftNode: Node<T>?
    var rightNode: Node<T>?
    
    // MARK: - Lifecycle Functions
    init(value: T, leftNode: Node<T>? = nil, rightNode: Node<T>? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

struct BinarySearchTree<T: Comparable>: CustomStringConvertible {
    
    // MARK: - Properties
    private var rootNode: Node<T>?
    var description: String {
        get {
            return "\(String(describing: rootNode?.value))" + " -> " + "\(String(describing: rootNode?.leftNode?.value))" + " -> " + "\(String(describing: rootNode?.rightNode?.value))"
        }
    }
    
    // MARK: - Methods
    mutating public func insert(_ value: T) {
        let newNode = Node(value: value)
        if let rootNode = rootNode {
            var currentNode = rootNode
            while true {
                if value < currentNode.value {
                    // Left
                    guard let leftNode = currentNode.leftNode else { currentNode.leftNode = newNode; return }
                    currentNode = leftNode
                }
                else {
                    // Right
                    guard let rightNode = currentNode.rightNode else { currentNode.rightNode = newNode; return }
                    currentNode = rightNode
                }
            }
        }
        else {
            rootNode = newNode
        }
    }
}

var newTree: BinarySearchTree<Int> = BinarySearchTree()
newTree.insert(45)
newTree.insert(56)
newTree.insert(12)

print(newTree)
