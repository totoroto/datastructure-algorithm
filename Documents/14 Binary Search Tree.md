# 14. Binary Search Tree

left child는 부모 보다 작은 값을 갖고 right child는 부모 보다 같거나 큰 값을 갖는다

삽입, 삭제, 조회를 할 때 평균 O(log n)의 시간이 걸린다. (배열이나 링크드 리스트보다 빠름)

1. 삽입

    import Foundation
    
    public struct BinarySearchTree<T: Comparable> {
        public private(set) var root: BinaryNode<T>?
        
        public init() {}
        
        // insert
        public mutating func insert(_ value: T) {
            root = insert(from: root, value: value)
        }
        
        private func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
            guard let node = node else { return BinaryNode(value: value) }
            
            if value < node.value {
                node.leftChild = insert(from: node.leftChild, value: value)
            } else {
                node.rightChild = insert(from: node.rightChild, value: value)
            }
            return node
        }
    }

2. 조회 ( O(log n) )

    public func contains(_ value: T) -> Bool {
            var current = root
            
            while let node = current {
                if node.value == value {
                    return true
                }
                if value < node.value {
                    current = node.leftChild
                } else {
                    current = node.rightChild
                }
            }
            return false
        }

3. 삭제

1) Leaf Node인 경우

2) Leaf Node가 아닌 경우:

     - 삭제하는 노드의 child가 하나인 경우: 나머지 트리랑 다시 연결해줘야함 

     - 삭제하는 노드의 child가 두개인 경우: 오른쪽 subtree의 가장 작은 노드로 삭제된 자리를 교체

    private extension BinaryNode {
        var min: BinaryNode {
            return leftChild?.min ?? self
        }
    }
    
    extension BinarySearchTree {
        public mutating func remove(_ value: T) {
            root = remove(node: root, value: value)
        }
        
        private func remove(node: BinaryNode<T>?, value: T) -> BinaryNode<T>?{
            if node?.leftChild == nil && node?.rightChild == nil {
                return nil
            }
            if node?.leftChild == nil {
                return node?.rightChild
            }
            if node?.rightChild == nil {
                return node?.leftChild
            }
            
            node?.value = node?.rightChild?.min.value
            node?.rightChild = remove(node: node?.rightChild, value: node?.value)
        }
    }