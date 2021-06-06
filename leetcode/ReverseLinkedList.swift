/*
 206. ReverseLinkedList
 리스트의 앞쪽에 값 추가
 1
 2 1
 3 2 1
 */
import Foundation

//class LinkedList {
//    var head: ListNode?
//    var tail: ListNode?
//
//    func push(val: Int) {
//        head = ListNode(val, head)
//        if tail == nil { tail = head }
//    }
//}
//
//func reverseList(_ head: ListNode?) -> ListNode? {
//    let list = LinkedList()
//    var currentNode = head
//
//    while currentNode != nil {
//        list.push(val: currentNode!.val)
//        currentNode = currentNode?.next
//    }
//
//    return list.head
//}

func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var current = head
    
    while current != nil {
        let next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    return prev
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
