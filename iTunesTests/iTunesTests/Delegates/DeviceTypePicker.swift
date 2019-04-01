//
//  DeviceTypePicker.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

/// делегат для пикера девайса
class DeviceTypePicker: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerValue: String!
    let deviceTypeValues: [String] = ["","iPad", "iPhone"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return deviceTypeValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return deviceTypeValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickerValue = deviceTypeValues[row]
     }
}
