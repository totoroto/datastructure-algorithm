import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 1 { return 0 }
    
    var start = 0
    var end = nums.count - 1
    
    while start <= end {
        let index: Int = (start + end) / 2
        
        if nums[index] == target {
            return index
        } else if nums[index] < target {
            start = index+1
        } else {
            end = index-1
        }
    }
    
    return -1
}
