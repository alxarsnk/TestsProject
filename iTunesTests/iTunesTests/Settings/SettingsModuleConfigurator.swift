//
//  SettingsModuleConfigurator.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class SettingsModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    /// конфигурация модуля
    func configureModule() {
        
        let viewController = self.viewController as! SettingsViewController
        let presenter = SettingsPresenter()
        let alerManager = AlertManager()
        
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.alertManager = alerManager
        
    }
}
