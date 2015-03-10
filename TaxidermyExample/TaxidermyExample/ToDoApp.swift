//
//  ToDoApp.swift
//  TaxidermyExample
//
//  Created by Matt Delves on 10/03/2015.
//  Copyright (c) 2015 Reformed Software. All rights reserved.
//

import UIKit
import TaxidermyKit

class ToDoApp: Component {
    
    var items = ["feed the cat", "adopt swift"]
    var newItem = ""
    
    func textChanged(value: String) {
        newItem = value
    }
    
    func itemDeleted(index: Int) {
        items.removeAtIndex(index)
        AppRenderer.render()
    }
    
    func addItem() {
        items.append(newItem)
        AppRenderer.render()
    }
    
    func render() -> SimpleView {
        
        let textChangedHandler = EventHandlerWrapper(target: self, handler: ToDoApp.textChanged)
        let addItemHandler = EventHandlerWrapper(target: self, handler: ToDoApp.addItem)
        
        return SimpleView.View(CGRect(x: 0, y: 0, width: 300, height: 500),
            [
                SimpleView.TextField(CGRect(x: 0, y: 0, width: 200, height: 50), "Type item here", textChangedHandler),
                SimpleView.Button(CGRect(x: 200, y: 0, width: 100, height: 50), "Add", addItemHandler),
                ListItems(frame: CGRect(x: 0, y: 100, width: 300, height: 500), items: items, deleteAction: itemDeleted)
            ])
    }
}

class ListItem: Component {
    let item: String
    let frame: CGRect
    let deleteAction: () -> ()
    
    init(frame: CGRect, item: String, deleteAction: () -> ()) {
        self.frame = frame
        self.item = item
        self.deleteAction = deleteAction
    }
    
    func deleteItem() {
        deleteAction()
    }
    
    func render() -> SimpleView {
        
        let addItemHandler = EventHandlerWrapper(target: self, handler: ListItem.deleteItem)
        
        return SimpleView.View(frame,
            [
                SimpleView.Text(CGRect(x: 0, y: 0, width: 100, height: 50), item),
                SimpleView.Button(CGRect(x: 50, y: 0, width: 100, height: 50), "x", addItemHandler)
            ])
    }
}

class ListItems: Component {
    
    let items: [String]
    let frame: CGRect
    let deleteAction: (Int) -> ()
    
    init(frame: CGRect, items: [String], deleteAction: (Int) -> ()) {
        self.frame = frame
        self.items = items
        self.deleteAction = deleteAction
    }
    
    func render() -> SimpleView {
        var children = [Component]()
        var offset: CGFloat = 0.0
        for item in enumerate(items) {
            children.append(ListItem(frame: CGRect(x: 0, y: offset, width: frame.width, height: 50), item: item.element) {
                self.deleteAction(item.index)
                })
            offset += 50
        }
        
        return SimpleView.View(frame, children)
    }
}
