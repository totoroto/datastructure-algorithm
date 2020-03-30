# 10. Tree

- Tree의 용도

    계층적인 구조 표현

    정렬된 데이터 관리

    빠른 조회 하기

- Root 노드: Tree의 가장 위에 있는 노드. parent 노드를 갖지 않는 유일한 노드
- Leaf 노드: children을 갖지 않는 노드

    public class TreeNode<T> {
    	public var value: T
    	public var children: [TreeNode] = []
    	
    	public init(_ value: T) {
    		self.value = value
    	}
    
    	public func add(_ child: TreeNode) {
    		children.append(child)
    	}
    }
    
    // example
    let animal = TreeNode("Animal")
    let dog = TreeNode("Dog")
    let cat = TreeNode("Cat")
    
    animal.add(dog)
    animal.add(cat)

- 트리 순회하기
    1. Depth first traversal

        recursion을 사용하여 순회

            extension TreeNode {
            	public func forEachDepthFirst(visit: (TreeNode) -> Void) {
            		visit(self)
            		children.forEach {
            			$0.forEachDepthFirst(visit: visit)
            		}
            	}
            }

    2. Level-order traversal

        Queue를 이용하여 순회

            extension TreeNode {
            	public func forEachLevelOrder(visit: (TreeNode) -> Void) {
            		visit(self)
            		var queue = Queue<TreeNode>()
            		children.forEach { queue.enqueue($0) }
            
            		while let node = queue.dequeue() {
            			visit(node)
            			node.children.forEach { queue.enqueue($0) }
            		}
            	}
            }

    따라서, TreeNode 하단에 모든 노드를 iterate하는 메소드 추가하기

        extension TreeNode where T:Equatable {
        	public func search(_ value: T) -> TreeNode? {
        		var result: TreeNode?
        
        		forEachLevelOrder { node in
        			if node.value == value {
        				return node
        			}
        		}
        		return result
        	}
        }