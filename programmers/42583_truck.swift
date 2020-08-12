import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var timeCount = 0
    var inbridgeArray: [Int] = [Int](repeating: 0, count: bridge_length)
    var mutableTruckWeight = truck_weights
    var currentWeight = 0
    
    while inbridgeArray.count > 0 {
        timeCount += 1
        currentWeight -= inbridgeArray.removeFirst()
        
        if inbridgeArray.count < bridge_length {
            guard let firstItem = mutableTruckWeight.first else { continue }
            
            if firstItem + currentWeight <= weight {
                
                currentWeight += mutableTruckWeight.removeFirst()
                inbridgeArray.append(firstItem)
            } else {
                inbridgeArray.append(0)
            }
        }
    }
    return timeCount
}

//solution(2, 10, [7,4,5,6])
