import Foundation

func solution(_ s: String) -> Int {
    let wordNumbers: [String: String] = [
        "zero": "0",
        "one": "1",
        "two": "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9"
    ]
    
    var output: [String] = []
    var appended: [String] = []
    
    for character in Array(s) {
        let stringCharacter = String(character)
        
        if let number = Int(stringCharacter) {
            output.append(stringCharacter)
        } else {
            appended.append(stringCharacter)
            
            let joinedCharacter = appended.joined()
            if let matched = wordNumbers[joinedCharacter] {
                appended.removeAll()
                output.append(matched)
            }
        }
    }
    
    return Int(output.joined()) ?? 0
}