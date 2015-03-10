//
//  SimpleViewSpec.swift
//  TaxidermyKit
//
//  Created by Matthew Delves on 10/03/2015.
//  Copyright (c) 2015 Reformed Software. All rights reserved.
//

import Quick
import Nimble
import TaxidermyKit

class SimpleViewSpec: QuickSpec {
  func dummyHandler() {

  }

  override func spec() {
    describe("View") {
      it("renders") {
        let rect = CGRectMake(0, 0, 100, 100)
        let testView: SimpleView = SimpleView.View(rect, [])
        let result: UIView = createView(testView)
        expect(result).notTo(beNil())
      }

      it("children") {
        let rect = CGRectMake(0, 0, 100, 100)
        let handler = EventHandlerWrapper(target: self, handler: SimpleViewSpec.dummyHandler)
        let childView: SimpleView = SimpleView.Button(rect, "foo", handler)
        let testView: SimpleView = SimpleView.View(rect, [childView])

        let result: UIView = createView(testView)
        expect(result.subviews.count).to(equal(1))
      }
    }

    describe("Button") {
      it("renders") {
        let rect = CGRectMake(0, 0, 100, 100)
        let handler = EventHandlerWrapper(target: self, handler: SimpleViewSpec.dummyHandler)
        let testView: SimpleView = SimpleView.Button(rect, "foo", handler)
        let result: UIView = createView(testView)
        expect(result).notTo(beNil())
      }
    }

    describe("Text") {
      it("renders") {
        let rect = CGRectMake(0, 0, 100, 100)
        let testView: SimpleView = SimpleView.Text(rect, "foobar")
        let result: UIView = createView(testView)
        expect(result).notTo(beNil())
      }
    }

    describe("TextField") {
      it("renders") {
        let rect = CGRectMake(0, 0, 100, 100)
        let handler = EventHandlerWrapper(target: self, handler: SimpleViewSpec.dummyHandler)
        let testView: SimpleView = SimpleView.TextField(rect, "foobar", handler)
        let result: UIView = createView(testView)
        expect(result).notTo(beNil())
      }
    }
  }
}
