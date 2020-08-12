import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var orderArray: [(Int,Int)] = []
    var result: [Int] = []
    
    for i in 0..<priorities.count {
        orderArray.append((i, priorities[i]))
    }
    
//    print(orderArray)
    let i = 0
    while !orderArray.isEmpty {
        var max = 0
        orderArray.map { index, priority in
            if priority >= max {
                max = priority
            }
        }
        
        let itemPriority = orderArray[i].1
//        print("item: \(itemPriority)")
        
        if itemPriority == max {
            result.append(orderArray[i].0)
            orderArray.removeFirst()
        } else {
            let backupItem = orderArray.removeFirst()
            orderArray.append(backupItem)
//            print("backup: \(backupItem)")
        }
    }
    
    for i in 0..<result.count {
        if result[i] == location {
            return i+1
        }
    }
    
    return 0
}

//solution([1, 1, 9, 1, 1, 1], 0)
