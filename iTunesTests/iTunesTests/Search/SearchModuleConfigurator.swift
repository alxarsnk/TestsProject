//
//  SearchModuleConfigurator.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class SearchModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    /// скофигурирвоать модуль 
    func configureModule() {
        
        let viewController = self.viewController as! SearchViewController
        let presenter = SearchPresenter()
        let alertManager = AlertManager()
        
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.alertManager = alertManager
    }
}
