//
//  Event.swift
//  TaxidermyKit
//
//  Created by Matt Delves on 10/03/2015.
//  Copyright (c) 2015 Reformed Software. All rights reserved.
//

import UIKit

public class Event<T> {
    
  typealias EventHandler = T -> ()
  
  private var eventHandlers = [Invocable]()
  
  public init() {
  }
  
  /// Raises the event, invoking all handlers
  public func raise(data: T) {
    for handler in self.eventHandlers {
      handler.invoke(data)
    }
  }
  
  
  public func addHandler(invocable: Invocable) {
    eventHandlers.append(invocable)
  }
}

public protocol Invocable: class {
  func invoke(data: Any)
}

// takes a reference to a handler, as a class method, allowing
// a weak reference to the owning type.
// see: http://oleb.net/blog/2014/07/swift-instance-methods-curried-functions/
public class EventHandlerWrapper<T: Any, U> : Invocable {
  var target: T?
  let handler: T -> U -> ()
  
  public init(target: T?, handler: T -> U -> ()){
    self.target = target
    self.handler = handler
  }
  
  public func invoke(data: Any) -> () {
    if let t = target {
      handler(t)(data as U)
    }
  }
  
}