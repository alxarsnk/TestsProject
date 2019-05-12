//
//  Models.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import  UIKit

class Settings: NSObject, NSCoding {
   
    @objc var mediaType: String
    @objc var searchLimit: String
    @objc var deviceType: String
    
    init(mediaType: String, searchLimit: String, deviceType: String) {
        
        self.mediaType = mediaType
        self.searchLimit = searchLimit
        self.deviceType = deviceType
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(mediaType, forKey: #keyPath(Settings.mediaType))
        aCoder.encode(deviceType, forKey: #keyPath(Settings.deviceType))
        aCoder.encode(searchLimit, forKey: #keyPath(Settings.searchLimit))
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        mediaType = aDecoder.decodeObject(forKey: #keyPath(Settings.mediaType)) as! String
        deviceType = aDecoder.decodeObject(forKey: #keyPath(Settings.deviceType)) as! String
        searchLimit = aDecoder.decodeObject(forKey: #keyPath(Settings.searchLimit)) as! String
    }
}

class CellData {
    
    var name: String?
    var author: String?
    var description: String?
    var image: UIImage?
    var price: String
    var url: String?
    
    init(name: String?,
         author: String?,
         description: String?,
         image: UIImage?,
         price: String,
         url: String?) {
        
        self.name = name
        self.author = author
        self.description = description
        self.image = image
        self.price = price
        self.url = url
    }
}
