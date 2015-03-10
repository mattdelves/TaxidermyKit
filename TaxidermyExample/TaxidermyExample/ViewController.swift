//
//  ViewController.swift
//  TaxidermyExample
//
//  Created by Matt Delves on 10/03/2015.
//  Copyright (c) 2015 Reformed Software. All rights reserved.
//

import UIKit
import TaxidermyKit

var AppRenderer: Renderer!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let app = ToDoApp()
        
        AppRenderer = Renderer(hostView: view, app: app)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

