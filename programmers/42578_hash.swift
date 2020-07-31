import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesMap: [String:Int] = [:]
    
    for i in 0..<clothes.count {
        let kindOfClothes = clothes[i][1]
        let originVal = clothesMap[kindOfClothes] ?? 0
        clothesMap.updateValue(originVal + 1, forKey: kindOfClothes)
    }
    
    if clothesMap.count == 1 {
        return clothes.count
    } else {
        var sum = 1
        for (key, value) in clothesMap {
            sum *= (value + 1)
        }
        return sum - 1
    }
}
