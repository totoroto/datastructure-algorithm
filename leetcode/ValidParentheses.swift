import Foundation

public struct Stack<T> {
    private var storage: [T] = []
    public init() {}
    
    public mutating func push(_ element: T) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        return storage.popLast()
    }
    
    public func peek() -> T? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
}

func isValid(_ s: String) -> Bool {
    if s.count % 2 != 0 {
        return false
    }
    var stack = Stack<Character>()
    let arr = Array(s)
    
    for i in 0..<arr.count {
        switch arr[i] {
        case "(":
            stack.push(")")
        case "[":
            stack.push("]")
        case "{":
            stack.push("}")
        default:
            if stack.peek() == arr[i] {
                stack.pop()
            } else {
                stack.push(arr[i])
            }
        }
    }
    
    return stack.isEmpty
}

