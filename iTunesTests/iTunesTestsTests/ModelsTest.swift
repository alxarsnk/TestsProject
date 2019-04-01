//
//  ModelsTest.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 30/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import iTunesTests

class ModelsTest: XCTestCase {

    
    
    override func setUp() {
       
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testCreatingSettingsModel() {
        
        //give
        var modelTest: Settings!
        
        //when
        
        modelTest = Settings(mediaType: "some", searchLimit: "some", deviceType: "some")
        
        //then
        
        XCTAssertNotNil(modelTest, "nil")
    }
    
    func testEncodingandDecoding() {
        //give
       
        let modelTest = Settings(mediaType: "some", searchLimit: "some", deviceType: "some")
        var result: Settings?
        //when
        
        do {
            let archiver = try NSKeyedArchiver.archivedData(withRootObject: modelTest, requiringSecureCoding: false)
            
            UserDefaults.standard.set(archiver, forKey: "key")
            UserDefaults.standard.synchronize()
        } catch let error {
            print(error)
        }
       
        if let unarchived = UserDefaults.standard.data(forKey: "key") {
            
            do {
                if let unarchiveModelTest  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchived)  as? Settings {
                    result = unarchiveModelTest
                }
            } catch let error {
                print(error)
            }
        }
    
        
        //then
        XCTAssertEqual(modelTest.deviceType, result?.deviceType, "not equal")
        XCTAssertEqual(modelTest.searchLimit, result?.searchLimit, "not equal")
        XCTAssertEqual(modelTest.mediaType, result?.mediaType, "not equal")
    }
    
    func testCreatingCellDataModel() {
        
        //give
        var modelTest: CellData!
        
        //when
        
        modelTest = CellData(name: "some", author: "some", description: "some", image: UIImage(), price: "some", url: "some")
        
        //then
        
        XCTAssertNotNil(modelTest, "nil")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
