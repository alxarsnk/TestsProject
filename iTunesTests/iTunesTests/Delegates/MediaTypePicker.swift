//
//  MediaTypePicker.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

/// делегат для пикера контента
class MediaTypePicker: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerValue: String!
    
    let mediaTypeValues: [String] = ["","Movie", "Podcast", "Music Track", "Music Video", "AudioBook", "Software", "TV Show", "All Artists"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return mediaTypeValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return mediaTypeValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       pickerValue = mediaTypeValues[row]
     }
 }
