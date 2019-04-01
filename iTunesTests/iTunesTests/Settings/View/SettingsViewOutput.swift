//
//  SettingsViewOutput.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol SettingsViewOutput: AnyObject {
    
    /// принятие выбранных настроек
    ///
    /// - Parameters:
    ///   - mediaType: инфа о пикере контента
    ///   - deviceType: инфа о пикере девайса
    ///   - limitType: инфа о пикере лимита
    func applySetting(mediaType: MediaTypePicker, deviceType: DeviceTypePicker, limitType: LimitPicker)
}
