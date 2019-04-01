//
//  SearchViewInput.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewInput: AnyObject {
    
    /// отобразить алерт
    ///
    /// - Parameter alert: алерт, который нужно отобразить
    func displayAlert(alert: UIAlertController)
}
