import Foundation

public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else { return }
    
    for end in (1..<array.count).reversed() {
        var swapped = false
        
        for current in 0..<end {
            if array[current] > array[current+1] {
                array.swapAt(current, current+1)
                swapped = true
            }
        }
        
        if !swapped { return }
    }
}

//var array = [9, 4, 10, 3]
//bubbleSort(&array)
//print("\(array)") // 3, 4, 9, 10
