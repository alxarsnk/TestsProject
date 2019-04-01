//
//  AlertManager.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 30/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

protocol AlertManagerProtocol {
    
    /// созадет алерт
    ///
    /// - Parameters:
    ///   - title: заголовк алерта
    ///   - body: тело алерта
    /// - Returns: возвращает алерт, чтобы вью его смогла показать
    func showAlet(title: String, body: String) -> UIAlertController
}

class AlertManager: AlertManagerProtocol {
    
    func showAlet(title: String, body: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        return alert
    }
  }
