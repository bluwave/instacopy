//
//  LoginInteractorTests.swift
//  instacopy
//
//  Created by Garrett Richards on 10/21/15.
//  Copyright © 2015 Acme. All rights reserved.
//

import XCTest

class LoginInteractorTests: XCTestCase {
    
    var interactor = LoginInteractor()
    
    override func setUp() {
        super.setUp()
        interactor = LoginInteractor()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogin() {
        interactor.login("foo", password: "password") { (error) -> Void in
            print("hello world")
        }
    }
}
