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

    func testCreatingSettingsModel() {
        
        //give
        let constant = "some"
        
        //when
        let modelTest = Settings(mediaType: constant, searchLimit: constant, deviceType: constant)
        
        //then
        
        XCTAssertNotNil(modelTest, "nil")
    }
    
    func testEncodingAndDecoding() {
        
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
        let constant = "some"
        
         //when
        
        let modelTest = CellData(name: constant, author: constant, description: constant, image: UIImage(), price: constant, url: constant)
        
        //then
        
        XCTAssertNotNil(modelTest, "nil")
    }

    func testPerformanceExample() { }

}
