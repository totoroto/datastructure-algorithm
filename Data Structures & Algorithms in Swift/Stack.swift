import Foundation

// Chapter 6: Stack Data Structure
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

extension Stack: CustomStringConvertible {
    // let array = ["A", "B", "C", "D"]
    // var stack = Stack(array)
    
    public init(_ elements: [T]) {
        storage = elements
    }
    
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n--------"
        
        let stackElements = storage.map{"\($0)"}
                                   .reversed()
                                   .joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

extension Stack: ExpressibleByArrayLiteral {
    // var stack: Stack = [1.0, 2.0, 3.0]
    public init(arrayLiteral elements: T...) {
        storage = elements
    }
}
