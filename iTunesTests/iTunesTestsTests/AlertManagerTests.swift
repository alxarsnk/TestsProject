//
//  AlertManagerTests.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 30/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import iTunesTests
class AlertManagerTests: XCTestCase {
    
    let alertMAnager = AlertManager()
    
    override func setUp() { }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
      
    }

    func testCreatingAlert() {
        
        //give
        let alert = UIAlertController(title: "some", message: "some", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        
        //when
        
        let alertTest = alertMAnager.showAlet(title: "some", body: "some")
        
        //then
        
        XCTAssertEqual(alert.title, alertTest.title, "not equal")
        XCTAssertEqual(alert.message, alertTest.message, "not equal")
    }
    
    func testPerformanceExample() { }

}
