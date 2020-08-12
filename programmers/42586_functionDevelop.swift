import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let totalCount = progresses.count
    var peek = 0

    var workDay = [Int](repeating: 0, count: totalCount)
    var result: [Int] = []
    
    for i in 0..<progresses.count {
        let substract = Double(100 - progresses[i]) / Double(speeds[i])
        workDay[i] = Int(ceil(substract))
        
        if workDay[i] > peek {
            peek = workDay[i]
            result.append(1)
        } else {
            result[result.count-1] += 1
        }
    }
    
    return result
}

//solution([93,30,55], [1,30,5])
