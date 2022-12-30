import Foundation

class Node<T> {
    // MARK: - Properties
    let value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next  = next else { return "\(value)"}
        return "\(value)\n" + String(describing: next)
    }
}

struct Stack<T> {
    // MARK: - Properties
    private var top: Node<T>?
    
    // MARK: - Methods
    var isEmpty: Bool {
        return top == nil
    }
    
    mutating func push(_ value: T) {
        let currentTop = top
        top = Node(value: value)
        top?.next = currentTop
    }

    @discardableResult
    mutating func pop() -> T? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    func peek() -> T? {
        return top?.value
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        guard let top = top else { return "------------- STACK IS EMPTY --------------"}
        return "------------ STACK BEGINS --------------\n" + String(describing: top) +  "\n------------ STACK ENDS --------------"
    }
}

var randomNumber: Stack<Double> = Stack()
randomNumber.push(44.824)
randomNumber.push(24)
randomNumber.push(2)
randomNumber.push(8.2)
randomNumber.push(128.6)
randomNumber.pop()

print(randomNumber)
