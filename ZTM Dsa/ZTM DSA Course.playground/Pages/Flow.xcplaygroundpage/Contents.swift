import Cocoa
var greeting = "Hello, playground"

// Array will be string
// ["a", "c", "d"] - ["z", "y", "i"] == False
// ["a", "c", "d"] - ["a", "y", "i"] == True

// Brute Force Approach
func checkForSomethingCommonInArrayWithBruteApproach(array1: [String], array2: [String]) -> Bool {
    for element1 in array1 {
        for element2 in array2 {
            if element1 == element2 {
                return true
            }
        }
    }
    return false
}

checkForSomethingCommonInArrayWithBruteApproach(array1: ["a", "c", "e"], array2: ["b", "d", "f"])


// Optimise Approach
/*
 Hash Table: A symbol table of generic key-value pairs.
 
 The key must be `Hashable`, which means it can be transformed into a fairly
 unique integer value. The more unique the hash value, the better.
 
 Hash tables use an internal array of buckets to store key-value pairs. The
 hash table's capacity is determined by the number of buckets. This
 implementation has a fixed capacity--it does not resize the array as more
 key-value pairs are inserted.
 
 To insert or locate a particular key-value pair, a hash function transforms the
 key into an array index. An ideal hash function would guarantee that different
 keys map to different indices. In practice, however, this is difficult to
 achieve.
 
 Since different keys can map to the same array index, all hash tables implement
 a collision resolution strategy. This implementation uses a strategy called
 separate chaining, where key-value pairs that hash to the same index are
 "chained together" in a list. For good performance, the capacity of the hash
 table should be sufficiently large so that the lists are small.
 
 A well-sized hash table provides very good average performance. In the
 worst-case, however, all keys map to the same bucket, resulting in a list that
 that requires O(n) time to traverse.
 
 Average Worst-Case
 Space:   O(n)     O(n)
 Search:  O(1)     O(n)
 Insert:  O(1)     O(n)
 Delete:  O(1)     O(n)
 */
public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    /// The number of key-value pairs in the hash table.
    private(set) public var count = 0
    
    /// A Boolean value that indicates whether the hash table is empty.
    public var isEmpty: Bool { return count == 0 }
    
    /**
     Create a hash table with the given capacity.
     */
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    /**
     Accesses the value associated with
     the given key for reading and writing.
     */
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    /**
     Returns the value for the given key.
     */
    public func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil  // key not in hash table
    }
    
    /**
     Updates the value stored in the hash table for the given key,
     or adds a new key-value pair if the key does not exist.
     */
    @discardableResult public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Do we already have this key in the bucket?
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        // This key isn't in the bucket yet; add it to the chain.
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    /**
     Removes the given key and its
     associated value from the hash table.
     */
    @discardableResult public mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Find the element in the bucket's chain and remove it.
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil  // key not in hash table
    }
    
    /**
     Removes all key-value pairs from the hash table.
     */
    public mutating func removeAll() {
        buckets = Array<Bucket>(repeatElement([], count: buckets.count))
        count = 0
    }
    
    /**
     Returns the given key's array index.
     */
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
}

extension HashTable: CustomStringConvertible {
    /// A string that represents the contents of the hash table.
    public var description: String {
        let pairs = buckets.flatMap { b in b.map { e in "\(e.key) = \(e.value)" } }
        return pairs.joined(separator: ", ")
    }
    
    /// A string that represents the contents of
    /// the hash table, suitable for debugging.
    public var debugDescription: String {
        var str = ""
        for (i, bucket) in buckets.enumerated() {
            let pairs = bucket.map { e in "\(e.key) = \(e.value)" }
            str += "bucket \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        return str
    }
}
func checkForSomethingCommonInArrayWithOptimiseApproach(array1: [String], array2: [String]) -> Bool {
    //    let map: HashTable = []
    
    for i in 0...array1.count-1 {
        i.hashValue
    }
    
    return false
}


// Google Interview Question
func hasPairWithSum(array : [Int], sum : Int) -> Bool {
    var length = array.count
    
    for i in 0...length-1 {
        for j in stride(from: i+1, to: length, by: 1) {
            if (array[i] + array[j] == sum) {
                return true
            }
        }
    }
    return false
}

hasPairWithSum(array: [1,2,4,2], sum: 6)


func hasPairWithSum2(array: [Int], sum : Int) -> Bool {
    var myIntArray: [Int] = []
    var mySet = Set(myIntArray)
    let length = array.count - 1
    
    for i in 0...length {
        if mySet.contains(array[i]) {
            return true
        }
        mySet.insert(sum - array[i])
    }
    return false
}

hasPairWithSum(array: [1,2,3,4], sum: 8)


// MARK: - Arrays
var stringsArray = ["hello", "world", "oop", "dp"]
stringsArray.insert("Leo Dicaprico", at: 0)
stringsArray.removeFirst(2)


// Static vs Dynamic Array
// WRONG HERE --- var statoArrayHere = [Int]() // This is a static array good for memory optimaisation and performance
var dynoArrayHere = [Int]()
var testArrayTwo = [Int]()

class Student {
    var age: Int
    var name: String
    
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}

let studentOne = Student(age: 20, name: "Johny")
let studentTwo = studentOne
let studentThree = Student(age: 20, name: "Johny")

studentOne === studentTwo
studentThree === studentOne

// MARK: - Creating Array from Scratch
class MyArray {
    var count: Int
    var data: [Any]
    init() {
        self.count = 0
        self.data = []
    }
    
    func get(index: Int) -> Any {
        return self.data[index]
    }
    
    func push(item: Any) -> Int {
        self.data[self.count] = item
        self.count += 1
        return self.count
    }
    
    func pop() {
        let lastItem = self.data[self.count - 1]
        //        remove(lastItem)
        self.count -= 1
    }
}

let newArray = MyArray()
newArray.count
//newArray.push(item: "Hello")


// MARK: - Reverse a Array
func reverse(arr: [Int]) -> [Int] {
    var containerArray: [Int] = []
    
    for i in stride(from: arr.count - 1, through: 0, by: -1) {
        containerArray.append(arr[i])
    }
    
    return containerArray
}

reverse(arr: [1,2,4])

// MARK: - Reverse a String with extension
extension String {
    func customReverse() -> String {
        var containerString : String = ""
        
        for i in self {
            containerString = "\(i)" + containerString
        }
        
        return containerString
    }
}

"HelloWorld".customReverse()


// MARK: - Reverse a String with func

func customReverse(str : String) -> String {
    var containerString : String = ""
    
    for i in str {
        containerString = "\(i)" + containerString
    }
    
    return containerString
}
customReverse(str: "Hello World")


// MARK: - Merge two sorted arrays into one large sorted array
func mergeSortedArrays(array1: [Int], array2: [Int]) -> [Int] {
    var mergedArray: [Int] = []
    var array1Item = array1[0]
    var array2Item = array2[0]
    var index = 1
    var jendex = 1
    
    if array1.isEmpty {
        return array2
    }
    
    if array2.isEmpty {
        return array1
    }
    
    while ((array1Item != 0) || (array2Item != 0)) {
        print(array1Item, array2Item)
        if array1Item < array2Item {
            mergedArray.append(array1Item)
            array1Item = array1[index]
            index += 1
        }
        else {
            mergedArray.append(array2Item)
            array2Item = array2[jendex]
            jendex += 1
        }
    }
    
    return mergedArray
}

//mergeSortedArrays(array1: [1,3,5,7], array2: [2,4,6,8])

[1,3,5,7]
[2,4,6,8]

var numsss = [1,2,3,4,5,6,7,8]
var indexOfNumber = numsss.firstIndex(of: 2)
let newNumberss = numsss.remove(at: indexOfNumber!)
numsss.append(newNumberss)


// MARK: - Move Zeros to end
func moveZeroes(_ nums: inout [Int]) {
    var newIndex: Int = 0
    var newNumber: Int = 0
    
    for i in nums {
        if i == 0 {
            newIndex = nums.firstIndex(of: i) ?? 0
            newNumber = nums.remove(at: newIndex)
            nums.append(newNumber)
        }
    }
}

var numsCustom: [Int] = []
moveZeroes(&numsCustom)

// MARK: - Contains Duplicate Leetcode using Set()
func containsDuplicateBool(_ nums: [Int]) -> Bool {
    return Set(nums).count != nums.count
}

containsDuplicateBool([12,67,85,22,12,46])

// MARK: - Contains Duplicate Leetcode return duplicate nums
func containsDuplicateTuple(_ nums: [Int]) -> (Bool, Int?) {
    var uniqueNumberArray: Set<Int> = Set()
    var emptySet: Set<Int> = Set()
    
    for num in nums {
        print(num)
        if uniqueNumberArray.contains(num) {
            return (true, num)
        }
        uniqueNumberArray.insert(num)
    }
    
    return (false, nil)
}


containsDuplicateTuple([67,68,69,70])

// MARK: - Maximum Subarray Leetcode Question
func maxSubArray(_ nums: [Int]) -> Int {
    return 0
}


// MARK: - Two Sum Question
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    
    for (i, num) in nums.enumerated() {
        if let indexOfNumber = dict[target - num] {
            if i != indexOfNumber {
                return [indexOfNumber, i]
            }
        }
        dict[num] = i
    }
    
    return[0]
}

twoSum([2,7,11,15], 9)

var dictt : [Int:Int] = [:]
