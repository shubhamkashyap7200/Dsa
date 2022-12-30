import Foundation

// MARK: - Defination

class Node<T>: CustomStringConvertible {
    // MARK: - Properties
    var value: T
    var next: Node?
    
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next)
    }
    
    // MARK: - Lifecycle
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct Queue<T>: CustomStringConvertible {
    // MARK: - Properties
    private var first: Node<T>?
    private var last: Node<T>?
    
    var isEmpty: Bool {
        get {
            return first == nil
        }
    }
    
    var description: String {
        get {
            guard let first = first else { return "Empty Queue" }
            return String(describing: first)
        }
    }
    
    // MARK: - Lifecycle
//    init(first: Node<T>? = nil, last: Node<T>? = nil) {
//        self.first = first
//        self.last = last
//    }
    
    // MARK: - Methods
    func peek() -> T? {
        guard let first = first else { return nil }
        return first.value
    }
    
    mutating func push(_ value: T) {
        first = Node(value: value, next: first)
        if last == nil {
            last = first
        }
    }
    
    // Add to last
    public mutating func enqueue(_ value: T) {
        if isEmpty {
            self.push(value)
            return
        }
        last?.next = Node(value: value)
        last = last?.next
    }
    
    
    // remove from the first
    @discardableResult
    public mutating func dequeue() -> T? {
        defer {
            first = first?.next
        }
        return first?.value
    }
}

var movieQueue: Queue<String> = Queue()
movieQueue.peek()
movieQueue.dequeue()
movieQueue.enqueue("Snape")
movieQueue.enqueue("Lily")
movieQueue.enqueue("Lucius")
movieQueue.enqueue("Sirius")
movieQueue.enqueue("Peter")
//movieQueue.dequeue()
movieQueue.isEmpty

print(movieQueue)


