//
//  KekSepetiUITests.swift
//  KekSepetiUITests
//
//  Created by Hüseyin  Bayır on 4.01.2025.
//

import XCTest
@testable import KekSepeti

final class KekSepetiUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddToBucket() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // MARK: Store List View
        // Find the first store button and tap it
        let storeButton = app.buttons["StoreCell0"]
        XCTAssertTrue(storeButton.exists, "1st store button existing")
        storeButton.tap()
        
        // MARK: Cake Detail View
        // Add all items of store to bucket
        for i in 0...5 {
            // Find the first cake button and tap it
            let cakeButton = app.buttons["CakeButton\(i)"]
            XCTAssertTrue(cakeButton.exists, "Cake button \(i) existing")
            cakeButton.tap()
            
            // Find special requests toggle and tap it
            let specialRequestsToggle = app.switches["SpecialRequestsToggle"].switches.firstMatch
            XCTAssertTrue(specialRequestsToggle.exists, "Special requests toggle existing")
            specialRequestsToggle.tap()
            
            // Find extra cream toggle and tap it
            let extraCreamToggle = app.switches["ExtraCreamToggle"].switches.firstMatch
            XCTAssertTrue(extraCreamToggle.exists, "Extra cream toggle existing")
            extraCreamToggle.tap()
            
            // Find the extra sprinkles button and tap it
            let extraSprinklesButton = app.switches["ExtraSprinklesToggle"].switches.firstMatch
            XCTAssertTrue(extraSprinklesButton.exists, "Extra sprinkles toggle existing")
            extraSprinklesButton.tap()
            
            // Find the add to bucket button and tap it
            let addToBucketButton = app.buttons["AddToBucketButton"]
            XCTAssertTrue(addToBucketButton.exists, "Add to bucket button existing")
            addToBucketButton.tap()
        }
        
        testConfirmingBucket(from: app)
    }
    
    func testConfirmingBucket(from app: XCUIApplication) {
        // MARK: Back to Store List View
        // Find the bucket button and tap it
        let bucketButton = app.buttons["BucketButton"]
        XCTAssertTrue(bucketButton.exists, "Bucket button existing")
        bucketButton.tap()
        
        // MARK: Bucket View
        // Find the confirm bucket button and tap it
        let confirmBucketButton = app.buttons["ConfirmBucket"]
        XCTAssertTrue(confirmBucketButton.exists, "Confirm bucket button existing")
        confirmBucketButton.tap()
        
        testAddNewAddress(from: app)
    }
    
    func testAddNewAddress(from app: XCUIApplication) {
        
        // MARK: Address View
        
            // Find the new address button and tap it
            let confirmBucketButton = app.buttons["NewAddressButton"]
            XCTAssertTrue(confirmBucketButton.exists, "Confirm new address button existing")
            confirmBucketButton.tap()
        
        
        // MARK: New Address View
        /*
        // Find the name text field and tap it
        let nameField = app.textFields["NameField"]
        XCTAssertTrue(nameField.exists, "Name field existing")
        nameField.tap()
        
        // Type text into the TextField
        let nameText = "Elon Musk"
        nameField.typeText(nameText)
        */
        
        // Find the area text field and tap it
        let areaField = app.textFields["AreaField"]
        XCTAssertTrue(areaField.exists, "Area Field existing")
        areaField.tap()
        
        // Type text into the TextField
        let areaText = "Nişantaşı"
        areaField.typeText(areaText)
        
        app.swipeUp()
        
        // Find the zip text field and tap it
        let zipField = app.textFields["ZipField"]
        XCTAssertTrue(zipField.exists, "Zip field existing")
        zipField.tap()
        
        // Type text into the ZipField
        let zipText = "34000"
        zipField.typeText(zipText)
        
        // Find the confirm bucket button and tap it
        let confirmAddressButton = app.buttons["ConfirmAddress"]
        XCTAssertTrue(confirmAddressButton.exists, "Confirm address button existing")
        confirmAddressButton.tap()
        
        // MARK: Back to Address View again
        // Find the confirm bucket button and tap it
        let selectAddressButton = app.buttons["SelectAddress"].firstMatch
        XCTAssertTrue(selectAddressButton.exists, "Confirm address button existing")
        selectAddressButton.tap()
        
        testCheckOut(from: app)
    }
    
    func testCheckOut(from app: XCUIApplication) {
        // MARK: Check Out View
        // Swipe up to see check out button
        app.swipeUp()
        
        // Find the leave package button and tap it
        let leavePackageButton = app.switches["LeavePackageButton"].switches.firstMatch
        XCTAssertTrue(leavePackageButton.exists, "Remember me toggle existing")
        leavePackageButton.tap()
        
        // Find the confirm bucket button and tap it
        let confirmCheckOutButton = app.buttons["CheckOutButton"]
        XCTAssertTrue(confirmCheckOutButton.exists, "Confirm check out button existing")
        confirmCheckOutButton.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
