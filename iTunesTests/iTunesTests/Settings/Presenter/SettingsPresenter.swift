//
//  SettingsPresenter.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsViewOutput {
    
    //MARK: - Constants
    
    weak var view: SettingsViewInput!
    var alertManager: AlertManagerProtocol!
    
    let keyForCoding = "currentSettings"
    let emptyString = ""
    
    //MARK: - Methods
    
    func sayViewDisplayErrorAlert() {
        
        view.displayAlert(alert: alertManager.showAlet(title: "Error", body: "Incorrect Values"))
    }
    
    func saveSettingsToUserDefaults(settings: Settings, forKey: String) {
        do {
            let archiver = try NSKeyedArchiver.archivedData(withRootObject: settings, requiringSecureCoding: false)
            
            UserDefaults.standard.set(archiver, forKey: forKey)
            UserDefaults.standard.synchronize()
        } catch let error {
            print(error)
        }
    }
    
    //MARK: - SettingsViewOutput
    
    func applySetting(mediaType: MediaTypePicker, deviceType: DeviceTypePicker, limitType: LimitPicker){
       
        if var media = mediaType.pickerValue,
            let device = deviceType.pickerValue,
            let limit = limitType.pickerValue {
            
            if media != emptyString && device != emptyString && limit != emptyString {
                
                switch media {
                case "Movie":
                    media = "movie"
                case "Podcast":
                    media = "podcast"
                case "Music Track":
                    media = "musicTrack"
                case "Music Video":
                    media = "musicVideo"
                case "AudioBook":
                    media = "audiobook"
                case "TV Show":
                    media = "tvSeason"
                case "Software":
                    
                    switch device {
                    case "iPhone":
                        media = "software"
                    case "iPad":
                        media = "iPadSoftware"
                    default:
                        break
                    }
                case "All Artists":
                    media = "allArtist"
                default:
                    break
                }
                
                let currentSettings = Settings(mediaType: media, searchLimit: limit, deviceType: device)
                
                saveSettingsToUserDefaults(settings: currentSettings, forKey: keyForCoding)
                
                print("Yor choose is: \n\(media)\n\(device)\n\(limit) ")
            } else { sayViewDisplayErrorAlert()}
        } else { sayViewDisplayErrorAlert()}
    }
}
