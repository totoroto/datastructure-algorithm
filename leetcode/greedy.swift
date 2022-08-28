import Foundation


// https://leetcode.com/problems/maximum-units-on-a-truck/submissions/
func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
    let sortedArr = boxTypes.sorted(by: { $0[1] > $1[1] }) // Unit이 많은 순으로 소팅
    var sum = 0
    var capacity = truckSize

    for i in 0..<sortedArr.count {
        if capacity <= 0 { break }
        let numberOfBox = sortedArr[i][0] < capacity ? sortedArr[i][0] : capacity

        sum += numberOfBox * sortedArr[i][1]
        capacity -= sortedArr[i][0]
    }

    return sum
}

//maximumUnits([[5,10],[2,5],[4,7],[3,9]], 10)


//https://leetcode.com/problems/minimum-operations-to-make-the-array-increasing/
func minOperations(_ nums: [Int]) -> Int {
    var nums = nums
    guard nums.count > 1 else { return 0 }

    var diff = 0
    for i in 1..<nums.count {
        if nums[i-1] >= nums[i] {
            diff += nums[i-1] - nums[i] + 1
            nums[i] = nums[i-1] + 1
        }
    }
    return diff
}

//minOperations([1,1,1])


// https://leetcode.com/problems/maximum-69-number/
func maximum69Number (_ num: Int) -> Int {
    let charArr: [Character] = String(num).map { $0 }
    var copyArr = charArr
    var maxNumber = num

    for i in 0..<copyArr.count {
        copyArr = charArr

        if copyArr[i] == "9" {
            copyArr[i] = "6"
        } else {
            copyArr[i] = "9"
        }

        let joined = Int(String(copyArr)) ?? 0
        maxNumber = max(maxNumber, joined)
    }
    return maxNumber
}

//maximum69Number(9669)


// https://leetcode.com/problems/split-a-string-in-balanced-strings/
func balancedStringSplit(_ s: String) -> Int {
    let charArr: [Character] = s.map { $0 }
    var pivot = 0
    var count = 0

    for i in 0..<s.count {
        if charArr[i] == "R" {
            pivot += 1
        } else {
            pivot -= 1
        }

        if pivot == 0 { count += 1 }
    }

    return count
}

//balancedStringSplit("LLLLRRRR")
