import Foundation

public class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next)
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else { return "Empty List" }
        return String(describing: head)
    }
}

extension LinkedList : Collection {
    public struct Index: Comparable {
        public var node: Node<T>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }

    public var startIndex: Index {
        return Index(node: head)
    }
    // 2
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    // 3
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    // 4
    public subscript(position: Index) -> T {
        return position.node!.value
    }
}

//extension LinkedList {
//    mutating func push(_ value: T) {
//        head = Node(value: value, next: head)
//        if tail == nil { tail = head }
//    }
//
//    mutating func append(_ value: T) {
//        guard !isEmpty else {
//            push(value)
//            return
//        }
//        tail?.next = Node(value: value)
//        tail = tail?.next
//    }
//
//    func node(at index: Int) -> Node<T>? {
//        var currentNode = head
//        var currentIndex = 0
//
//        while currentNode != nil && currentIndex < index {
//            currentNode = currentNode?.next
//            currentIndex += 1
//        }
//        return currentNode
//    }
//
//    mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
//        guard tail !== node else {
//            append(value)
//            return tail!
//        }
//        node.next = Node(value: value, next: node.next)
//        return node.next!
//    }
//
//    mutating func pop() -> T? {
//        defer {
//            head = head?.next
//            if isEmpty {
//                tail = nil
//            }
//        }
//        return head?.value
//    }
//
//    mutating func removeLast() -> T? {
//        guard let head = head else { return nil }
//        guard head.next != nil else { return pop() } // 노드가 하나인 경우
//
//        var prev = head
//        var current = head
//
//        // next 노드가 nil일 때까지 반복 (마지막 노드 찾기)
//        while let next = current.next {
//            prev = current
//            current = next
//        }
//        prev.next = nil
//        tail = prev
//
//        return current.value
//    }
//
//    mutating func remove(after node: Node<T>) -> T? {
//        defer {
//            if node.next === tail {
//                tail = node
//            }
//            node.next = node.next?.next
//        }
//        return node.next?.value
//    }
//}
//
//var list = LinkedList<Int>()
//list.push(3)
//list.push(2)
//list.push(1)
//
//let index = 1
//let node = list.node(at: index - 1)!
//let removedValue = list.remove(after: node)
//
//print("After removing at index \(index): \(list)")
//print("Removed value: " + String(describing: removedValue))
