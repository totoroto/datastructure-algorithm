import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var dic: [Int:Int] = [:]
    
    for i in 0..<nums.count {
        if dic[nums[i]] != nil { //key exist
            dic.removeValue(forKey: nums[i])
        } else {
            dic.updateValue(1, forKey: nums[i])
        }
    }
    
    return dic.first?.key ?? 0
}
