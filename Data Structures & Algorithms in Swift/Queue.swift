import Foundation

public protocol Queue {
    associatedtype T
    
    mutating func enqueue(_ element: T) -> Bool
    mutating func dequeue() -> T?
    
    var isEmpty: Bool { get }
    var peek: T? { get }
}

// 1. Array-based
public struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init() {}
     
    // O(1)
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    // O(n)
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}
