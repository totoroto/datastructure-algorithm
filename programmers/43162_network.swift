//
//  Network.swift
//  Algorithm
//
//  Created by summer on 2022/11/24.
//

import Foundation

// 네트워크 https://school.programmers.co.kr/learn/courses/30/lessons/43162

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var nodes: [Int: [Int]] = .init()
    for i in 0..<n { // 초기화 생각..
        nodes[i] = []
    }
    
    for i in 0..<n {
        for j in 0..<i {
            if computers[i][j] == 1, computers[i][j] == computers[j][i] {
                nodes[i]?.append(j)
                nodes[j]?.append(i)
            }
        }
    }
    
    var count = 0
    var visited: [Int] = []
    for i in 0..<n {
        if !visited.contains(i) {
            count += 1
            dfs(start: i, visited: &visited, nodes: nodes)
        }
    }
    
    return count
}

func dfs(start: Int, visited: inout [Int], nodes: [Int: [Int]]) {
    visited.append(start)
    
    nodes[start]?.forEach({ element in
        if !visited.contains(element) {
            dfs(start: element, visited: &visited, nodes: nodes)
        }
    })
}

//print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
