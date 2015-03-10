//
//  App.swift
//  TaxidermyKit
//
//  Created by Matt Delves on 10/03/2015.
//  Copyright (c) 2015 Reformed Software. All rights reserved.
//

import UIKit

public struct App {
    var renderer: Renderer
    
    public init(renderer: Renderer) {
        self.renderer = renderer
    }
    
    public func render() {
      renderer.render()
    }
}
