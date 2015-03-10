//
//  View.swift
//  TaxidermyKit
//
//  Created by Matt Delves on 10/03/2015.
//  Copyright (c) 2015 Reformed Software. All rights reserved.
//

import UIKit

public enum ReactView: Component {
    case View(CGRect, [Component])
    case Button(CGRect, String, Invocable)
    case Text(CGRect, String)
    case TextField(CGRect, String, Invocable)
    
    public func render() -> ReactView {
        return self
    }
}
