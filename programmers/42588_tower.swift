import Foundation

func solution(_ heights:[Int]) -> [Int] {
    var result = Array<Int>(repeating: 0, count: heights.count)
    
    for i in (0..<heights.count).reversed() {
//        print(i)
        for j in (0..<i).reversed() {
//            print("#\(j)")
            let sub = heights[i] - heights[j]
            if sub < 0 {
                result[i] = j + 1
                break
            }
        }
        
    }
//    print("result: \(result)")
    return result
}

// 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges
// https://programmers.co.kr/learn/courses/30/lessons/42588

