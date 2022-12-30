import Foundation

// MARK: - Defination

struct TwoStackQueue<T>: CustomStringConvertible {
    // MARK: - Properties
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    var description: String {
        if isEmpty {
            return "Queue is empty".uppercased()
        }
        
        var allElements: [T] = []
        
        if leftStack.isEmpty == false {
            allElements.append(contentsOf: leftStack.reversed())
        }
        
        allElements.append(contentsOf: rightStack)
        
        return "------ QUEUE START ------ \n" + allElements.map({ "\($0)" }).joined(separator: " -> ") + "\n------- QUEUE ENDS -------"
    }
    
    // MARK: - Methods
    func peek() -> T? {
        guard let last = leftStack.last else { return nil}
        guard let first = rightStack.first else { return nil }
        
        return leftStack.isEmpty ? first: last
    }
    
    public mutating func enqueue(_ element: T) {
        rightStack.append(element)
    }
    
    @discardableResult
    public mutating func deque() -> T? {
        if isEmpty {
            return nil
        }
        
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.removeLast()
    }
}


var snacksQueue: TwoStackQueue<String> = TwoStackQueue()
snacksQueue.enqueue("Percy")
snacksQueue.enqueue("Goover")
snacksQueue.enqueue("Anabeth")
snacksQueue.enqueue("Luke")
snacksQueue.enqueue("Ares")
snacksQueue.enqueue("Tyson")
snacksQueue.deque()
print(snacksQueue)
