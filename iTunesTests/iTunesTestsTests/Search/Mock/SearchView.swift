//
//  SearchView.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 31/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit
@testable import iTunesTests

class SearchViewMock: SearchViewInput {
    
    var displayAlertCalled = false
    
    func displayAlert(alert: UIAlertController) {
        displayAlertCalled = true
    }
}
