//
//  SwiftExtensionTests.swift
//  SwiftExtensionTests
//
//  Created by zhaoheqiang on 16/6/4.
//  Copyright © 2016年 zhaoheqiang. All rights reserved.
//

import XCTest
@testable import SwiftExtension

class SwiftExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        print("<b>123".htmlFormatString())
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}