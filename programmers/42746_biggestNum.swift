import Foundation

func solution(_ numbers:[Int]) -> String {
    var stringNumbers = numbers.map { (element) -> String in
        return String(element)
    }

    stringNumbers = stringNumbers.sorted {
        print("\($0 + $1) \($1 + $0)")
        return $0 + $1 > $1 + $0
    }
    
    if stringNumbers[0] == "0" { return "0" } //[0,0,0,0,0,0]

//    let result = stringNumbers.reduce("") {
//        $0 + $1
//    }
    
    return stringNumbers.joined()
}

//solution([6, 10, 2])
