//
//  TestCarUI.swift
//  TestCarUI
//
//  Created by 123 on 13.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import XCTest

class TestCarUI: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFerrariF12DataDisplayed() {
        let app = XCUIApplication()
        let table = app.tables.element(boundBy: 0)
        
        let ferrariCell = table.cells.element(boundBy: 0)
        XCTAssert(ferrariCell.staticTexts["Ferrari F12"].exists)
        XCTAssert(ferrariCell.staticTexts["730 HP"].exists)
        
        let zondaCell = table.cells.element(boundBy: 1)
        XCTAssert(zondaCell.staticTexts["Pagani Zonda F"].exists)
        XCTAssert(zondaCell.staticTexts["602 HP"].exists)
        
        let lamboCell = table.cells.element(boundBy: 2)
        XCTAssert(lamboCell.staticTexts["Lamborghini Aventador"].exists)
        XCTAssert(lamboCell.staticTexts["700 HP"].exists)
    }
    
}
















