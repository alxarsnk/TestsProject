//
//  SearchViewTests.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 31/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import iTunesTests

class SearchViewTests: XCTestCase {

    var view: SearchViewController!
    
    override func setUp() {
       view = SearchViewController()
    }

    override func tearDown() {
       view = nil
    }
    
    func testViewCheckSettings() {
        
        //given
        let presenter = SearchPresnterMock()
        view.output = presenter
        
        //when
        view.checkCurrentSettingsButton(String())
        
        //then
        XCTAssert(presenter.showSearchSettingsCalled)
        
    }
   
    func testPerformanceExample() { }

}
