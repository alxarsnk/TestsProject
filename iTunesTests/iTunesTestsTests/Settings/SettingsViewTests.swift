//
//  SettingsViewTests.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 01/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import iTunesTests

class SettingsViewTests: XCTestCase {

    var view: SettingsViewController!
    
    override func setUp() {
        view = SettingsViewController()
    }

    override func tearDown() {
        view = nil
    }

    func testApplySettings() {
        
        //given
        let presenter = SettingsPreseneterMock()
        view.output = presenter
        
        //when
        view.applySettings(String())
        
        //then
        XCTAssert(presenter.applySettingCalled)
     }

    func testPerformanceExample() { }

}
