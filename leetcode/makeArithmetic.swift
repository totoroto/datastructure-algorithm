// 1502. Can Make Arithmetic Progression From Sequence
import Foundation

func canMakeArithmeticProgression(_ array: [Int]) -> Bool {
    guard array.count > 1 else { return true }
    
    let arr = array.sorted()
    
    for k in 1..<arr.count {
        let num = arr[k] - arr[k-1]
        for i in 2..<arr.count {
            if num != arr[i] - arr[i-1] {
                return false
            }
        }
    }
    
    return true
}

//canMakeArithmeticProgression([1,2,4])
