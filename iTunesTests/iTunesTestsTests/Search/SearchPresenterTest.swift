//
//  SearchPresenterTest.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 01/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import iTunesTests
class SearchPresenterTest: XCTestCase {

    var presenter: SearchPresenter!
    var alertManager =  AlertManager()
    override func setUp() {
       presenter = SearchPresenter()
    }

    override func tearDown() {
        presenter = nil
    }

    
    func testShowFail() {
        
        //given
        let view = SearchViewMock()
        presenter.view = view
        presenter.alertManager = alertManager
        
        //when
        presenter.showFailAlert()
        
        //then
        XCTAssert(view.displayAlertCalled)
        
    }
    
    func testShowSearchSettings() {
        
        //given
        let view = SearchViewMock()
        presenter.view = view
        presenter.alertManager = alertManager
        
        //when
        presenter.showSearchSettings()
        
        //then
        XCTAssert(view.displayAlertCalled)
        
    }

    func testPerformanceExample() { }

}
