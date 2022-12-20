import Foundation

// MARK: - First Recuring element in array - Google Question
//Google Question
//Given an array = [2,5,1,2,3,5,1,2,4]:
//It should return 2

//Given an array = [2,1,1,2,3,5,1,2,4]:
//It should return 1

//Given an array = [2,3,4,5]:
//It should return undefined


func findDuplicate(_ nums: [Int]) -> Int? {
    
    var dict = [Int:Int]()
    
    for num in nums {
        dict[num] = (dict[num] ?? 0) + 1
        if dict[num] ?? 0 >= 2 { return num }
    }
    return nil
}

findDuplicate([2,5,5,2,3,5,1,2,4])

//Bonus... What if we had this:
// [2,5,5,2,3,5,1,2,4]
// return 5 because the pairs are before 2,2

