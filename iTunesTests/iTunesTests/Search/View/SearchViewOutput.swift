//
//  SearchViewOutput.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol SearchViewOutput: AnyObject {
    
    /// показать текущие натсройки доступа
    func showSearchSettings()
    
    /// показать ошибку
    func showFail()
}
