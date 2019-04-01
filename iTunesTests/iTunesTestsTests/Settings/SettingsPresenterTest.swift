//
//  SettingsPresenterTest.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 01/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import iTunesTests

class SettingsPresenterTest: XCTestCase {

    var preseneter: SettingsPresenter!
    var alertManager =  AlertManager()
    
    override func setUp() {
    preseneter = SettingsPresenter()
        
    }

    override func tearDown() {
    preseneter = nil
        
    }

    func testDisplayAlert() {
        //given
        let view = SettingsViewMock()
        
        preseneter.view = view
        preseneter.alertManager = alertManager
        
        //when
        preseneter.sayViewDisplayErrorAlert()
        
        //then
         XCTAssert(view.displayAlertCalled)
    }
    
    func testSaveToUserDefaults() {
        //given
        let view = SettingsViewMock()
        
        preseneter.view = view
        preseneter.alertManager = alertManager
        
        
        //when
        preseneter.saveSettingsToUserDefaults(settings: Settings(mediaType: "", searchLimit: "", deviceType: ""), forKey: "key")
        
       
        
        //then
        if let currentAccountData = UserDefaults.standard.data(forKey: "key") {
            
            do {
                if let currentSettings  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(currentAccountData)  as? Settings {
                    
                }
            } catch let error {
                print(error)
                XCTFail("catched error")
            }
            
        }
    }
    
    func testUnsuccessSaveToUserDefaults() {
        //given
        let view = SettingsViewMock()
        
        preseneter.view = view
        preseneter.alertManager = alertManager
        
        
        //when
        preseneter.saveSettingsToUserDefaults(settings: Settings(mediaType: "", searchLimit: "", deviceType: ""), forKey: "key")
        
        
        
        //then
        if let currentAccountData = UserDefaults.standard.data(forKey: "s") {
            XCTFail("catched error")
            do {
                if let currentSettings  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(currentAccountData)  as? Settings {
                    
                }
            } catch let error {
                print(error)
               
            }
            
        }
    }
    
    func testApplySettings() {
        //given
        
        let view = SettingsViewMock()
        
        preseneter.view = view
        preseneter.alertManager = alertManager
        
        //when
        preseneter.applySetting(mediaType: MediaTypePicker(), deviceType: DeviceTypePicker(), limitType: LimitPicker())
        
        //then
         XCTAssert(view.displayAlertCalled)
        
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
