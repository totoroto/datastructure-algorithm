# 12. Binary Tree

각 노드는 최대 두개의 children을 가질 수 있다. (left, right)

    public class BinaryNode<T> {
    	public var value: T
    	public var leftChild: BinaryNode?
    	public var rightChild: BinaryNode?
    
    	public init(value: T) {
    		self.value = value
    	}
    }

- 트리 순회하기 : in-order, pre-order, post-order   "O(n)"

    In-order

    노드가 left child를 갖고있다면, left 먼저 recursive하게 방문

    자기 노드 방문

    노드가 right child를 갖고있다면, right recursive하게 방문

        extension BinaryNode {
        	public func traverseInOrder(visit: (T)->Void) {
        		leftChild?.traverseInOrder(visit: visit)
        		visit(self)
        		rightChild?.traverseInOrder(visit: visit)
        	}
        }

    Pre-order

     자기 노드 가장 처음 방문 - left child 방문 - right child 방문

    Post-order

     left child 방문 - right child 방문 - 자기 노드 방문