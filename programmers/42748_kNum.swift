import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    for command in commands {
        let startIndex = command[0] - 1
        let endIndex = command[1] - 1
        let targetIndex = command[2] - 1
        let sortedSplitArray = array[startIndex...endIndex].sorted()
        
        result.append(sortedSplitArray[targetIndex])
    }
    
    return result
}

//let array = [1,5,2,6,3,7,4]
//let commands = [[2,5,3], [4,4,1], [1,7,3]]
//
//solution(array, commands)
