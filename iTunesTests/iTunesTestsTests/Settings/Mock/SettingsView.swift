//
//  SettingsView.swift
//  iTunesTestsTests
//
//  Created by Александр Арсенюк on 01/04/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit
@testable import iTunesTests

class SettingsViewMock: SettingsViewInput {
    
    var displayAlertCalled = false
    
    func displayAlert(alert: UIAlertController) {
         displayAlertCalled = true
    }
}
