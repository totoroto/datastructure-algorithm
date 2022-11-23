//
//  evaluateBooleanTree.swift
//  Algorithm
//
//  Created by summer on 2022/11/24.
//

import Foundation

// https://leetcode.com/problems/evaluate-boolean-binary-tree/

func evaluateTree(_ root: TreeNode?) -> Bool {
    guard let root = root else { return false }

    switch root.val {
    case 0:
        return false
    case 1:
        return true
    case 2: // OR
        return evaluateTree(root.left) || evaluateTree(root.right)
    case 3: // AND
        return evaluateTree(root.left) && evaluateTree(root.right)
    default:
        break
    }
    
    return false
}
