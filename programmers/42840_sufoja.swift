import Foundation

func solution(_ answers: [Int]) -> [Int] {
    let personOne = [1, 2, 3, 4, 5]
    let personTwo = [2, 1, 2, 3, 2, 4, 2, 5]
    let personThree = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var arr: [Int] = [Int](repeating: 0, count: 3)
    
    for i in 0..<answers.count {
        if personOne[i % personOne.count] == answers[i % answers.count] {
            arr[0] += 1
        }
        
        if personTwo[i % personTwo.count] == answers[i % answers.count] {
            arr[1] += 1
        }
        
        if personThree[i % personThree.count] == answers[i % answers.count] {
            arr[2] += 1
        }
    }
    
    var result: [Int] = []
    let max = arr.max() ?? 0
    
    arr.enumerated().map { (index, element) in
        if max == element {
            result.append(index + 1)
        }
    }
    
    return result
}

//solution([1,2,3,4,5])
