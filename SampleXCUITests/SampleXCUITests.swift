//
//  SampleXCUITests.swift
//  SampleXCUITests
//
//  Created by Pankaj Yadav on 12/04/23.
//  Copyright © 2023 BrowserStack. All rights reserved.
//

import XCTest
import PercyXcui

class SampleXCUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testText() {
        let app = XCUIApplication()
        let appPercy = AppPercy()
        
        do {
            try appPercy.screenshot(name: "First Screenshot")
        } catch {
            NSLog("App percy screenshot failed")
        }
        
        //visit the text page
        app.buttons["Text"].tap()
        
        let enterText = "Hi Percy!!"
        
        //verify that the text field has come up
        XCTAssert(app.textFields["Enter a text"].exists)
        
        //write the text
        app.textFields["Enter a text"].tap()
        app.textFields["Enter a text"].typeText(enterText)
        app.typeText("\r")
        
        do {
            var options = ScreenshotOptions()
            options.navigationBarHeight = 100
            options.statusBarHeight = 100
            try appPercy.screenshot(name: "Second Screenshot", options: options)
        } catch {
            NSLog("App percy screenshot failed")
        }
        
        //verify that the text entered matches the text view
        XCTAssertEqual(app.staticTexts.element.label, enterText)
    }
}
