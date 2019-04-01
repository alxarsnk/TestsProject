//
//  SearchPresenter.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class SearchPresenter: SearchViewOutput {
    
    weak var view: SearchViewInput!
    var alertManager: AlertManagerProtocol!
    
    let keyForCoding = "currentSettings"
    
    //MARK: - SearchViewOutput
    func showFail() {
        view.displayAlert(alert: alertManager.showAlet(title: "Error with your request", body: "Please use English language"))
    }
    
    func showSearchSettings() {
        
        let type: String
        let device: String
        let limit: String
        var info = ""
        
        if let currentAccountData = UserDefaults.standard.data(forKey: keyForCoding) {
            
            do {
                if let currentSettings  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(currentAccountData)  as? Settings {
                    
                    type = currentSettings.mediaType
                    info.append(contentsOf: "Type: \(type)\n")
                    if type == "software" || type == "iPadSoftware" {
                        device = currentSettings.deviceType
                        info.append(contentsOf:"Device: \(device)\n")
                    }
                    
                    limit = currentSettings.searchLimit
                    info.append(contentsOf:"Count: \(limit)\n")
                }
            } catch let error {
                print(error)
                view.displayAlert(alert: alertManager.showAlet(title: "Error", body: "Incorrect Values"))
            }
            view.displayAlert(alert: alertManager.showAlet(title: "Your settings", body: info))
        } else {
            view.displayAlert(alert: alertManager.showAlet(title: "Oops...", body: "At first you should set up your settings"))
        }
    }
}
