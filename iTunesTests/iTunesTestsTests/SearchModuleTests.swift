//
//  SearchModuleTests.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 30/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import iTunesTests

class SearchModuleTests: XCTestCase {

    let cellClass = SearchTableViewCell()
    var vc = SearchViewController()
    var presenter = SearchPresenter()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       vc.output = presenter
    presenter.view = vc
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
//    
//    func testCinfigureCell() {
//        //give
//        let image = try! UIImage(data: Data(contentsOf: URL(string: "https://avatars.mds.yandex.net/get-pdb/1058492/5d8d2f50-68fa-42b4-9205-0652b1c05fcb/s1200")!))
//        let newCell = CellData(name: "some", author: "some", description: "some", image: image, price: "some", url: "some")
//        
//        //when
//        cellClass.cinfigureCell(withModel: newCell)
//        //then
//        
//        XCTAssertEqual(cellClass.nameLabel.text, newCell.name, "not equal")
//    }
    
    func testViewCheckSettings(){
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
