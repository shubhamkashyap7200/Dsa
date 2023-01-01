import Foundation
func spacer() -> () {
    return print("\n------------------------\n")
}

// MARK: - Recursion
var counter = 0

func generateInt() -> String {
    
    print(counter)
    if counter >= 5 {
        return "DONE"
    }
    else {
        counter += 1
        generateInt()
    }
    
    return "Not Completed"
}

print(generateInt())
spacer()


// MARK: - Factorial using recursion
private func factorialUsingRecursion(_ inputInt: Int) -> Int {
    guard inputInt > 0 else { return 0 }
    
    if inputInt == 2 {
        return 2
    }
    
    return inputInt * factorialUsingRecursion(inputInt - 1)
}

print(factorialUsingRecursion(5))

// MARK: - Factorial using for loop iterative approach
private func factorialUsingIterative(_ inpuntInt: Int) -> Int {
    var answer = 1
    
    for i in stride(from: 2, through: inpuntInt, by: 1) {
        answer = answer * i
    }
    
    return answer
}

print(factorialUsingIterative(5))
spacer()

// MARK: - Fibonacci Series using recursion
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
func fibonacciSeriesNumberUsingRecursion(_ inputNumber: Int) -> Int {
    guard inputNumber >= 0 else { return 0 }
    
    if inputNumber < 2 {
        return inputNumber
    }
    
    return fibonacciSeriesNumberUsingRecursion(inputNumber - 1) + fibonacciSeriesNumberUsingRecursion(inputNumber - 2)
}

print(fibonacciSeriesNumberUsingRecursion(8))

// MARK: - Fibonacci Series using iterative
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
func fibonacciSeriesNumberUsingIteration(_ inputNumber: Int) -> Int {
    guard inputNumber >= 0 else { return 0 }
    var tempArray = [0,1]
    
    for i in stride(from: 2, through: inputNumber, by: 1) {
        tempArray.append(tempArray[i-2] + tempArray[i-1])
    }
    return tempArray[inputNumber]
}

print(fibonacciSeriesNumberUsingIteration(75))
