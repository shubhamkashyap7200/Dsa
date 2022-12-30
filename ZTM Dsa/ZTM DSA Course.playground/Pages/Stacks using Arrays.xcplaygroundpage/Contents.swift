import Foundation

struct Stack<T> {
    // MARK: - Properties
    fileprivate var array: [T] = []
    
    // MARK: - Methods
    
    /// IS EMPTY
    public var isEmpty: Bool {
        get {
            return array.isEmpty
        }
    }
    
    /// PUSH
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    /// POP
    mutating func pop() -> T? {
        array.popLast()
    }
    
    /// PEEK
    public func peek() -> T? {
        return array.last
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "------- STACK ------- \n"
        let bottomDivider = "\n-----------\n"
        
        
        let stackElements = array.reversed().map({ "\($0)" }).joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

// MARK: - Testcases
var books: Stack<String> = Stack()
books.push("Seven hanged among us")
books.push("The last of sparta")
books.push("Alice in the wonderland")
books.peek()
books.isEmpty
print(books)
