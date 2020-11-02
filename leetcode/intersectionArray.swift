// 350. Intersection of Two Arrays II

import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result: [Int] = []
    
    let sortedNums1 = nums1.sorted()
    let sortedNums2 = nums2.sorted()
    
    var i = 0
    var j = 0
    while i < sortedNums1.count && j < sortedNums2.count {
        if sortedNums1[i] == sortedNums2[j] {
            result.append(sortedNums1[i])
            i += 1
            j += 1
        } else if sortedNums1[i] < sortedNums2[j] {
            i += 1
        } else {
            j += 1
        }
    }
    
//    if sortedNums1.count > sortedNums2.count {
//        let temp = sortedNums1
//        sortedNums1 = sortedNums2
//        sortedNums2 = temp
//    }
//
//    for i in 0..<sortedNums1.count {
//        for j in 0..<sortedNums2.count {
//            if sortedNums1[i] == sortedNums2[j] {
//                result.append(sortedNums1[i])
//                sortedNums2.remove(at: j)
//                break
//            }
//        }
//
//    }
    return result
}

//intersect([3,1,2], [1,1])
