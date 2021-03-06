//
//  Renderer.swift
//  TaxidermyKit
//
//  Created by Matt Delves on 10/03/2015.
//  Copyright (c) 2015 Reformed Software. All rights reserved.
//

import UIKit

public class Renderer {
    let hostView: UIView
    let app: Component
    var components: [Component] = [Component]()
    
    // we need to retain the most recent view, so that any event handlers
    // are retained
    var reactView: SimpleView!
    
    public init(hostView: UIView, app: Component) {
        self.hostView = hostView
        self.app = app
        render()
    }
    
    public func render() {
        reactView = self.app.render()
        let uiView = createView(reactView)
        
        for subview in hostView.subviews {
            subview.removeFromSuperview()
        }
        self.hostView.addSubview(uiView)
    }
}

public func createView(virtualView: SimpleView) -> UIView {
    var components = [Component]()
    
    switch virtualView {
    case let .View(frame, children):
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
        for child in children {
            components.append(child)
            view.addSubview(createView(child.render()))
        }
        return view
        
    case let .Button(frame, text, invocable):
        let view = UIButton(frame: frame)
        view.setTitleColor(UIColor.blueColor(), forState: .Normal)
        view.setTitle(text, forState: .Normal)
        view.tappedEvent.addHandler(invocable)
        return view
        
    case let .Text(frame, text):
        let view = UILabel(frame: frame)
        view.text = text
        return view
        
    case let .TextField(frame, text, invocable):
        let view = UITextField(frame: frame)
        view.text = text
        view.changedEvent.addHandler(invocable)
        return view
    }
}