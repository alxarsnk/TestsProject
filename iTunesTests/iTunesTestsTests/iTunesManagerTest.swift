//
//  iTunesManagerTest.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 30/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import iTunesTests

class iTunesManagerTest: XCTestCase {

     let managerMock = iTunesManager()
    
    override func setUp() {
       
        
    }

    override func tearDown() {
       
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testManager() {
        //given
        let expect = expectation(description: "Requet test")
        //when
        managerMock.makeRequest(withText: "asap", complition: { (results) in
            
            print("Results: \(results.count)")
            if results == nil {
                XCTFail("error")
            }
            
           
        })
         expect.fulfill()
        //then
        waitForExpectations(timeout: 5.0) { (error) in
            if error != nil {
                XCTFail("expect not full fill")
            }
        }
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
