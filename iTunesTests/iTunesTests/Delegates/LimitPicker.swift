//
//  LimitPicker.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

/// делегат для пикера лимита
class LimitPicker: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var limitValues: [String] = [""]
    var pickerValue: String!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        for item in 1...200 {
            limitValues.append(String(item))
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return 201
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return limitValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickerValue = limitValues[row]
     }
   }
