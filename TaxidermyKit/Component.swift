//
//  Component.swift
//  TaxidermyKit
//
//  Created by Matt Delves on 10/03/2015.
//  Copyright (c) 2015 Reformed Software. All rights reserved.
//

import UIKit

public protocol Component {
    func render() -> SimpleView
}