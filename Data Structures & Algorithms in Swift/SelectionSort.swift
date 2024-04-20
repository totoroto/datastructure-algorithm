import Foundation

public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else { return }
    
    for current in 0..<(array.count - 1) {
        var lowest = current
        
        for other in (current+1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

//var array = [9, 4, 10, 3]
//selectionSort(&array)
//print("\(array)") // 3, 4, 9, 10
