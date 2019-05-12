//
//  SearchPresenter.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 31/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
@testable import iTunesTests

class SearchPresnterMock: SearchViewOutput {
   
    var showSearchSettingsCalled = false
    var showFailCalled = false
    
    func showSearchSettings() {
        showSearchSettingsCalled = true
    }
    
    func showFailAlert() {
        showFailCalled = true
    }
 }
