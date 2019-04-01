//
//  SettingsViewController.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewInput {
  
    @IBOutlet weak var mediaTypePicker: UIPickerView!
    @IBOutlet weak var limitTypePickker: UIPickerView!
    @IBOutlet weak var deviceTypePicker: UIPickerView!
    
    var output: SettingsViewOutput!
    
    let mediaType = MediaTypePicker()
    let deviceType = DeviceTypePicker()
    let limitType = LimitPicker()
    
    
    //MARK: - Методы
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaTypePicker.dataSource = mediaType
        mediaTypePicker.delegate = mediaType
        
        deviceTypePicker.dataSource = deviceType
        deviceTypePicker.delegate = deviceType
        
        limitTypePickker.dataSource = limitType
        limitTypePickker.delegate = limitType
   }
   
    
    @IBAction func applySettings(_ sender: Any) {
        
        output.applySetting(mediaType: mediaType, deviceType: deviceType, limitType: limitType)
    }
    
    //MARK: - SettingsViewInput
    
    func displayAlert(alert: UIAlertController) {
        
        self.present(alert, animated: true, completion: nil)
    }
}
