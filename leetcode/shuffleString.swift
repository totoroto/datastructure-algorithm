// 1528. Shuffle String
import Foundation

func restoreString(_ s: String, _ indices: [Int]) -> String {
    var dic: [Int: Character] = [:]
    let strArr = Array(s)
    
    for i in 0..<indices.count {
        dic.updateValue(strArr[i], forKey: indices[i])
    }
    
    var result: [Character] = []
    for i in 0..<indices.count {
        result.append(dic[i]!)
    }
    return result.reduce("") {
        $0 + String($1)
    }
}

//restoreString("codeleet", [4,5,6,7,0,2,1,3])
