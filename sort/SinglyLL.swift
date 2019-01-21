//
//  SinglyLL.swift
//  sort
//
//  Created by Lawrence Herman on 11/14/18.
//  Copyright © 2018 Lawrence Herman. All rights reserved.
//

//import Foundation


class SinglyLLNode<T> {
  
  var value: T
  var next: SinglyLLNode?
  
  init(_ value: T) {
    self.value = value
    print("init \(value)")
    
  }
  
  deinit {
    print("deinit \(String(describing: value))")
  }
}


struct SinglyLinkedListIterator<T>: IteratorProtocol {

  typealias Element = SinglyLLNode<T>

  var currentNode: Element?

  init(startNode: Element?) {
    currentNode = startNode
  }

  mutating func next() -> SinglyLLNode<T>? {
    let node = currentNode
    currentNode = currentNode?.next
    return node
  }

}




// check memory for Struc SinglyLL

class SinglyLL<T>: Sequence {
  
  //  typealias Iterator = <#type#>
  

  

  
  typealias Iterator = SinglyLinkedListIterator<T>
  
  
  func makeIterator() -> SinglyLinkedListIterator<T> {
    return SinglyLinkedListIterator(startNode: head)
  }
  
//  func next() -> SinglyLL<T>.Element? {
//
//
//
//
//
//  }
  
  
  //        while let next = node.next {
  //          node = next
  //        }
  
  
  //  func makeIterator() -> SinglyLL<T>.Iterator {
  //    let x = Iterator(headNode: head as! SinglyLLNode<Any>)
  //    return x
  //
  //  }
  
  
  typealias Node = SinglyLLNode<T>
  
  // first
  var head: Node?
  
  // last
  var tail: Node?
  
  var isEmpty: Bool {
    return head == nil
  }
  //  deinit {
  //    print("singlyLL deinit")
  //  }
  //
  
  
  // possible count
  
  //addToHead, addFirst, this is a push for utilizing removeHead/pop
  func prepend(_ value: T) {
    let newNode = SinglyLLNode(value)
    
    if let currentHead = head {
      newNode.next = currentHead
    } else {
      tail = newNode
    }
    
    head = newNode
  }
  
  
  //addToTail, addLast, this is a push for utilizing removeTail/pop
  func append(_ value: T) {
    let newNode = SinglyLLNode(value)
    
    if let currentTail = tail {
      currentTail.next = newNode
    } else {
      head = newNode
    }
    
    tail = newNode
  }
  
  
  //  while let next = node.next {
  //    node = next
  //  }
  
  //
    func printHeadToTail() {
  
      if var headNode = head {
  
        // fix. has to be a way not to dupe print here
        print(headNode.value)
        while headNode.next != nil {
          headNode = headNode.next!
          print(headNode.value)
        }
      }
    }
  
}

// swift extension Array: RandomAccessCollection, MutableCollection


//The IndexingIterator type is the default iterator for any collection that doesn’t declare its own. It acts as an iterator by using a collection’s indices to step over each value in the collection. Most collections in the standard library use IndexingIterator as their iterator.
//By default, any custom collection type you create will inherit a makeIterator() method that returns an IndexingIterator instance, making it unnecessary to declare your own. When creating a custom collection type, add the minimal requirements of the Collection protocol: starting and ending indices and a subscript for accessing elements. With those elements defined, the inherited makeIterator() method satisfies the requirements of the Sequence protocol.

// Could use either prepend/removeFromHead or append/removeFromTail as stack push/pop
// LIFO.  As long as use same side

// this variable if not necessary if only want to use LL as a stack.  If want to use
// as a queue or if there is need to iterate over list from tail to head we need.

//
//  func clearLL() {
//
//    if head != nil {
//
//
//
//      while head?.next != nil {
//
//
//      }
//
//
//
//
//    }
//

//  }

//Stack protocol oriented approach

//  protocol Stackable {
//    associatedtype Element
//    mutating func push(_ element: Element)
//    func peek() -> Element?
//    mutating func pop() -> Element?
//    mutating func removeAll()
//  }

// Linked list protocol implementation

//  protocol Linkable {
//    associatedtype D
//    var value: D { get }
//    var next: Self? { get set }
//    var previous: Self? { get set }
//
//    init(value: D)
//  }
//



// returnFirst, returnHead
//  func popHead() -> SinglyLLNode? {
//
//    if let headNode = head {
//
//      head = headNode.next
//
//      // check for memory leak
//      return headNode
//
//    } else {
//      return nil
//    }
//
//  }



//  func nodeAt(index: Int) -> Node? {
//
//
//
//
//  }

//  public var first: Node? {
//    return head
//  }







// addToTail, addLast, push
// Would not have this func if SinglyLL did not have the last property.  Having
//  // to cycle over LL without it would cause O(n).
//  func append(value: Int) {
//    let newNode = SinglyLLNode(value: value)
//  }


