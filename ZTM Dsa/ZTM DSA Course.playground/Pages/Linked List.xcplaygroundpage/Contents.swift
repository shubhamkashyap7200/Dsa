import Foundation

// MARK: - Creating Node
class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

// MARK: - Linked List
struct LinkedList<T> {
    
    // MARK: - Static Properites
    var head: Node<T>?
    var tail: Node<T>?
    
    // MARK: - Dyanamic Properties
    var isEmpty: Bool {
        get {
            return head == nil
        }
    }
    
    // MARK: - Methods
    // Push Implementation
    mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        
        if tail == nil  {
            tail = head
        }
    }
    
    // Append Implementation
    mutating func append(_ value: T) {
        let node = Node(value: value)
        
        tail?.next = node
        tail = node
    }
    
    // Pop Implementation
    mutating func pop() -> T? {
        defer {
            head = head?.next
            
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
}

// MARK: - Creating new Linked List
var list = LinkedList<Int>()
list.push(10)
list.push(68)

print(list)
