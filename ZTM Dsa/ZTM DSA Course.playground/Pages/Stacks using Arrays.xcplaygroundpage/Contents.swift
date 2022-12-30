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



struct newStack<T> {
    fileprivate var array: [T] = []
    
    
    public var isEmpty: Bool {
        get {
            return array.isEmpty
        }
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
}

extension newStack: CustomStringConvertible {
    var description: String {
        let stackElements = array.reversed().map({ "\($0)" }).joined(separator: "\n")

            return "------- STACK STARTS -------\n" + stackElements + "\n------- STACK ENDS -------\n"
    }
}


var randomNumber: newStack<Int> = newStack()
randomNumber.push(44)
randomNumber.push(68)
randomNumber.push(23)
randomNumber.push(12)
randomNumber.pop()
randomNumber.peek()

print(randomNumber)
