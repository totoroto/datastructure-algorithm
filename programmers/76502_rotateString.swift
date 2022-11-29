//
//  76502_rotateString.swift
//  Algorithm
//
//  Created by summer on 2022/11/29.
//

import Foundation

//https://school.programmers.co.kr/learn/courses/30/lessons/76502
func solution(_ s:String) -> Int {
    var queue: [String] = s.map { String($0) }
    var result = 0
    
    for _ in 0..<queue.count {
        print(queue.reduce("", +))
        
        result += isValid(queue: queue)
        let element = queue.removeFirst()
        queue.append(element)
    }
    return result
}

func isValid(queue: [String]) -> Int {
    var queue = queue
    var stack: [String] = []
    
    while !queue.isEmpty {
        let element = queue.removeFirst()
        
        switch element {
        case "[":
            stack.append("[")
        case "(":
            stack.append("(")
        case "{":
            stack.append("{")
        case "]":
            if stack.isEmpty { return 0 }
            if stack.last == "[" {
                stack.removeLast()
            }
        case ")":
            if stack.isEmpty { return 0 }
            if stack.last == "(" {
                stack.removeLast()
            }
        case "}":
            if stack.isEmpty { return 0 }
            if stack.last == "{" {
                stack.removeLast()
            }
        default:
            break
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

//solution("}]()[{")
