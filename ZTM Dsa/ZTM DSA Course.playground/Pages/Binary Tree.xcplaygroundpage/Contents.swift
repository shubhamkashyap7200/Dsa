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
    
    public func tranverseInOrder(visit: (T) -> Void) {
        leftNode?.tranverseInOrder(visit: visit)
        visit(value)
        rightNode?.tranverseInOrder(visit: visit)
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
    mutating public func insert(_ element: T) {
        let node = Node(value: element)
        
        if let rootNode = rootNode {
            self.insert(rootNode, node)
        }
        else {
            rootNode = node
        }
    }
    
    // RECURSIVE FUNCTIONS
    private func insert(_ rootNode: Node<T>, _ node: Node<T>) {
        if rootNode.value > node.value {
            if let leftNode = rootNode.leftNode {
                self.insert(leftNode, node)
            }
            else {
                rootNode.leftNode = node
            }
        }
        else {
            if let rightNode = rootNode.rightNode {
                self.insert(rightNode, node)
            }
            else {
                rootNode.rightNode = node
            }
        }
    }
    
    public func containsUsingFunctional(_ value: T) -> Bool {
        guard let rootNode = rootNode else { return false }
        var found = false
        
        rootNode.tranverseInOrder {
            if $0 == value {
                found = true
            }
        }
        
        return found
    }
    
    public func contains(_ value: T) -> Bool {
        //        guard let rootNode = rootNode else { return false }
        var currentNode = rootNode
        
        while let node = currentNode {
            if node.value == value {
                return true
            }
            
            if value < node.value {
                currentNode = node.leftNode
            }
            
            else {
                if let rightNode  = node.rightNode {
                    currentNode = rightNode
                }
            }
        }
        
        return false
    }
}

var newTree: BinarySearchTree<Int> = BinarySearchTree()
newTree.insert(45)
newTree.insert(56)
newTree.insert(12)

newTree.containsUsingFunctional(15)
newTree.contains(14)

print(newTree)
