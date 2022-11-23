//
//  42578_hash.swift
//  Algorithm
//
//  Created by summer on 2022/11/24.
//

import Foundation

// https://school.programmers.co.kr/learn/courses/30/lessons/42578
func solution(_ clothes:[[String]]) -> Int {
    var dict: [String: [String]] = [:]
    
    for i in 0..<clothes.count {
        let name = clothes[i][0]
        let type = clothes[i][1]
        
        var updatedVal = dict[type] ?? []
        updatedVal.append(name)
        dict.updateValue(updatedVal, forKey: type)
    }
    
    var count = 1
    _ = dict.keys.map { key in
        count *= (dict[key]!.count + 1)
    }
    return count - 1
}
