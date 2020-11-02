// 242. Valid Anagram
import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count > 1 else {
        if s.count == 1 {
            return s == t
        }
        return true
    }
    
    if s.count == t.count {
        let sortedS = s.sorted()
        let sortedT = t.sorted()
        
        for i in 0..<s.count {
            if sortedS[i] != sortedT[i] {
                return false
            }
        }
    } else {
        return false
    }
    
    return true
}

//isAnagram("a", "b")
