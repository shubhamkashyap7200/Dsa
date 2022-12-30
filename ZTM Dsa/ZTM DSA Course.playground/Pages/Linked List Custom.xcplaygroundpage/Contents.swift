import Foundation

// MARK: - Defining a pointer in swift

let ptr = UnsafeMutablePointer<Int>.allocate(capacity: 4)
 
ptr.initialize(repeating: 1, count: 4)
print(ptr.pointee) // 1
 
ptr[1] = 2
print(ptr[1]) // 2


// MARK: - Defining a node here

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// MARK: - Adding properties of description in string

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

let node1 = Node(value: 5)
let node2 = Node(value: 10)
let node3 = Node(value: 20)

node1.next = node2
node2.next = node3

print(node1)


// MARK: - Defining a Linked List

public struct LinkedList<Value> {
    // MARK: - Properties
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    
    // MARK: - Methods
    
    public init() {}
    
    // isempty
    public var isEmpty: Bool {
        return head == nil
    }
    
    // count
    public var count: Int {
        
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    // push on the first
    public mutating func push(_ value: Value) {
        // 1
        head = Node(value: value, next: head)
        
        // 2
        if tail == nil {
            tail = head
        }
    }
    
    // append at the last
    public mutating func append(_ value: Value) {
        
        // 1
        guard !isEmpty else {
            push(value)
            return
        }
        
        // 2
        tail?.next = Node(value: value)
        
        // 3
        tail = tail?.next
    }
    
    // get index any specific node
    public func node(at index: Int) -> Node<Value>? {
        // 1
        var currentNode = head
        var currentIndex = 0
        
        // 2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // insert after specific node
    @discardableResult
    public mutating func insert(_ value: Value, after node : inout Node<Value>?) -> Node<Value>? {
        guard let tail = tail else { print("Tail is nil"); return nil}
        
        guard tail !== node else {
            append(value)
            return tail
        }
        
        node?.next = Node(value: value, next: node?.next)
        return node?.next
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        // 1
        guard let head = head else { return nil }
        
        // 2
        guard head.next != nil else { return pop() }
        
        // 3
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        // 4
        previous.next = nil
        tail = previous
        return current.value
    }
    
    @discardableResult mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    func reverseList() -> Node<Value>? {
        var prev: Node<Value>? = nil
        var headNode = head
        
        while headNode != nil {
            let nextHead = headNode?.next
            headNode?.next = prev
            prev = headNode
            headNode = nextHead
        }
        
        return prev
    }
}


extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        
        return String(describing: head)
    }
}


var numberLinkedList = LinkedList<Int>()

numberLinkedList.push(205)
numberLinkedList.push(456)
numberLinkedList.push(986)
print(numberLinkedList)


numberLinkedList.append(34)
print(numberLinkedList)

var savedNode = numberLinkedList.node(at: 1)
print(numberLinkedList)

print("-----")
 
numberLinkedList.insert(777, after: &savedNode)
print(numberLinkedList)

numberLinkedList.push(404)
print(numberLinkedList)

numberLinkedList.count

numberLinkedList.pop()
print(numberLinkedList)

numberLinkedList.removeLast()
print(numberLinkedList)


numberLinkedList.push(256)
numberLinkedList.push(388)
numberLinkedList.push(124)
numberLinkedList.append(180)

numberLinkedList.remove(after: Node(value: 124))

// appending
numberLinkedList.append(2)
numberLinkedList.pop()
numberLinkedList.count
print(numberLinkedList)


numberLinkedList.reverseList()
