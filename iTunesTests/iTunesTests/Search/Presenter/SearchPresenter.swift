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
    let titleFailErrorConstants = "Error with your request"
    let bodyFailErrorConstants = "Please use English language"
    let titleErrorCOnstant = "Error"
    let titleOopsCOnstant = "Oops..."
    let titleSettingsConstant = "Your settings"
    let bodyErrorConstant = "Incorrect Values"
    let bodyOopsCOnstant = "At first you should set up your settings"
    
    //MARK: - SearchViewOutput
    func showFailAlert() {
        view.displayAlert(alert: alertManager.showAlet(title: titleFailErrorConstants, body:bodyFailErrorConstants ))
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
                view.displayAlert(alert: alertManager.showAlet(title: titleErrorCOnstant, body: bodyErrorConstant))
            }
            view.displayAlert(alert: alertManager.showAlet(title: titleSettingsConstant, body: info))
        } else {
            view.displayAlert(alert: alertManager.showAlet(title: titleOopsCOnstant, body: bodyOopsCOnstant))
        }
    }
}
