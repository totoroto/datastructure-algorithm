import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] { // O(n^2)
    for i in 0..<nums.count - 1 {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] { // O(n)
    var dic: [Int:Int] = [Int:Int]()
    
    for i in 0..<nums.count {
        dic.updateValue(i, forKey: nums[i])
    }
    
    for i in 0..<nums.count {
        let value = target - nums[i]
        
        if dic.keys.contains(value) && dic[value] != i {
            return [i, dic[value]!]
        }
    }
    return [0]
}

func twoSum3(_ nums: [Int], _ target: Int) -> [Int] { // TIMEOUT
    for (index, num) in nums.enumerated() {
        let val = target - num
        
        if nums.contains(val) && index != nums.firstIndex(of: val)!{
            return [index, nums.firstIndex(of: val)!]
        }
        
    }
    return [0]
}




