//
//  iTunesManager.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class iTunesManager {
    
    lazy var cashedDataSource: NSCache<AnyObject, UIImage> = {
        
        let cashe = NSCache<AnyObject, UIImage>()
        return cashe
    }()
    
    let baseUrl = "https://itunes.apple.com/search?&term="
    let keyForCoding = "currentSettings"
    var fail = false
    
    /// парсинг Json для форматат Movie
    ///
    /// - Parameters:
    ///   - data: json info
    ///   - cellsArray: массив данных, в который добовляем новую информацию
    func parseMovie(data: Data, cellsArray: inout [CellData]) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        if let cells = json!["results"] as? NSArray {
           
            for cell in cells {
              
                if let cellInfo = cell as? [String: AnyObject] {
                    
                    let fullDescription: String?
                    
                    let name = cellInfo["trackName"] as? String
                    let author = cellInfo["artistName"] as? String
                    if let description = cellInfo["shortDescription"] as? String {
                        fullDescription = description
                    } else {
                        fullDescription = cellInfo["longDescription"] as? String
                    }
                    let viewUrl = cellInfo["trackViewUrl"] as? String
                    let imageURL = cellInfo["artworkUrl60"] as? String
                    let price = cellInfo["trackPrice"] as? NSNumber
                    
                    let priceAtSring = String(Double(truncating: price ?? 0))
                    let image: UIImage?
                   
                    if let newImage = self.cashedDataSource.object(forKey: imageURL as AnyObject) {
                        image = newImage
                    }
                    else {
                        
                        if let newImage = try? UIImage(data: Data(contentsOf: URL(string: imageURL!)!)) {
                            image = newImage
                            self.cashedDataSource.setObject(image!, forKey: imageURL as AnyObject)
                        } else {
                            image = nil
                        }
                      }
                    
                    let newCell = CellData(name: name, author: author, description: fullDescription, image: image, price: priceAtSring, url: viewUrl)
                    cellsArray.append(newCell)
                }
            }
        }
    }
    
    /// парсинг Json для форматат Podcast
    ///
    /// - Parameters:
    ///   - data: json info
    ///   - cellsArray: массив данных, в который добовляем новую информацию
    func parsePodcast(data: Data, cellsArray: inout [CellData]) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        if let cells = json!["results"] as? NSArray {
            
            for cell in cells {
                
                if let cellInfo = cell as? [String: AnyObject] {
                    
                   
                    
                    let name = cellInfo["trackName"] as? String
                    let author = cellInfo["artistName"] as? String
                    let description = cellInfo["collectionName"] as? String
                    let viewUrl = cellInfo["trackViewUrl"] as? String
                    let imageURL = cellInfo["artworkUrl60"] as? String
                    let price = cellInfo["trackPrice"] as? NSNumber
                    
                    let priceAtSring = String(Double(truncating: price ?? 0))
                    let image: UIImage?
                    
                    if let newImage = self.cashedDataSource.object(forKey: imageURL as AnyObject) {
                        image = newImage
                    }
                    else {
                        
                        if let newImage = try? UIImage(data: Data(contentsOf: URL(string: imageURL!)!)) {
                            image = newImage
                            self.cashedDataSource.setObject(image!, forKey: imageURL as AnyObject)
                        } else {
                            image = nil
                        }
                    }
                    
                    let newCell = CellData(name: name, author: author, description: description, image: image, price: priceAtSring, url: viewUrl)
                    cellsArray.append(newCell)
                }
            }
        }
    }
    
    /// парсинг Json для форматат MusicTarck
    ///
    /// - Parameters:
    ///   - data: json info
    ///   - cellsArray: массив данных, в который добовляем новую информацию
    func parseMusicTrack(data: Data, cellsArray: inout [CellData]) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        if let cells = json!["results"] as? NSArray {
            
            for cell in cells {
                
                if let cellInfo = cell as? [String: AnyObject] {
                    
                    
                    let name = cellInfo["trackName"] as? String
                    let author = cellInfo["artistName"] as? String
                    let description = cellInfo["primaryGenreName"] as? String
                    let viewUrl = cellInfo["trackViewUrl"] as? String
                    let imageURL = cellInfo["artworkUrl60"] as? String
                    let price = cellInfo["trackPrice"] as? NSNumber
                    
                    let priceAtSring = String(Double(truncating: price ?? 0))
                    let image: UIImage?
                    
                    if let newImage = self.cashedDataSource.object(forKey: imageURL as AnyObject) {
                        image = newImage
                    }
                    else {
                        
                        if let newImage = try? UIImage(data: Data(contentsOf: URL(string: imageURL!)!)) {
                            image = newImage
                            self.cashedDataSource.setObject(image!, forKey: imageURL as AnyObject)
                        } else {
                            image = nil
                        }
                    }
                    
                    let newCell = CellData(name: name, author: author, description: description, image: image, price: priceAtSring, url: viewUrl)
                    cellsArray.append(newCell)
                }
            }
        }
    }
    
    /// парсинг Json для форматат MusicVideo
    ///
    /// - Parameters:
    ///   - data: json info
    ///   - cellsArray: массив данных, в который добовляем новую информацию
    func parseMusicVideo(data: Data, cellsArray: inout [CellData]) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        if let cells = json!["results"] as? NSArray {
            
            for cell in cells {
                
                if let cellInfo = cell as? [String: AnyObject] {
                    
                    
                    let name = cellInfo["trackName"] as? String
                    let author = cellInfo["artistName"] as? String
                    let description = cellInfo["primaryGenreName"] as? String
                    let viewUrl = cellInfo["trackViewUrl"] as? String
                    let imageURL = cellInfo["artworkUrl60"] as? String
                    let price = cellInfo["trackPrice"] as? NSNumber
                    
                    let priceAtSring = String(Double(truncating: price ?? 0))
                    let image: UIImage?
                    
                    if let newImage = self.cashedDataSource.object(forKey: imageURL as AnyObject) {
                        image = newImage
                    }
                    else {
                        
                        if let newImage = try? UIImage(data: Data(contentsOf: URL(string: imageURL!)!)) {
                            image = newImage
                            self.cashedDataSource.setObject(image!, forKey: imageURL as AnyObject)
                        } else {
                            image = nil
                        }
                    }
                    
                    let newCell = CellData(name: name, author: author, description: description, image: image, price: priceAtSring, url: viewUrl)
                    cellsArray.append(newCell)
                }
            }
        }
    }
    
    /// парсинг Json для формата audiobook
    ///
    /// - Parameters:
    ///   - data: json info
    ///   - cellsArray: массив данных, в который добовляем новую информацию
    func parseAudioBook(data: Data, cellsArray: inout [CellData]) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        if let cells = json!["results"] as? NSArray {
            
            for cell in cells {
                
                if let cellInfo = cell as? [String: AnyObject] {
                    
                    
                    let name = cellInfo["collectionName"] as? String
                    let author = cellInfo["artistName"] as? String
                    let description = cellInfo["description"] as? String
                    let viewUrl = cellInfo["collectionViewUrl"] as? String
                    let imageURL = cellInfo["artworkUrl60"] as? String
                    let price = cellInfo["collectionPrice"] as? NSNumber
                    
                    let priceAtSring = String(Double(truncating: price ?? 0))
                    let image: UIImage?
                    
                    if let newImage = self.cashedDataSource.object(forKey: imageURL as AnyObject) {
                        image = newImage
                    }
                    else {
                        
                        if let newImage = try? UIImage(data: Data(contentsOf: URL(string: imageURL!)!)) {
                            image = newImage
                            self.cashedDataSource.setObject(image!, forKey: imageURL as AnyObject)
                        } else {
                            image = nil
                        }
                    }
                    
                    let newCell = CellData(name: name, author: author, description: description, image: image, price: priceAtSring, url: viewUrl)
                    cellsArray.append(newCell)
                }
            }
        }
    }
    
    /// парсинг Json для форматат TVSHOW
    ///
    /// - Parameters:
    ///   - data: json info
    ///   - cellsArray: массив данных, в который добовляем новую информацию
    func parseTVShow(data: Data, cellsArray: inout [CellData]) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        if let cells = json!["results"] as? NSArray {
            
            for cell in cells {
                
                if let cellInfo = cell as? [String: AnyObject] {
                    
                    let fullDescription: String?
                    
                    let name = cellInfo["collectionName"] as? String
                    let author = cellInfo["artistName"] as? String
                    if let description = cellInfo["shortDescription"] as? String {
                        fullDescription = description
                    } else {
                        fullDescription = cellInfo["longDescription"] as? String
                    }
                    let viewUrl = cellInfo["collectionViewUrl"] as? String
                    let imageURL = cellInfo["artworkUrl60"] as? String
                    let price = cellInfo["collectionPrice"] as? NSNumber
                    
                    let priceAtSring = String(Double(truncating: price ?? 0))
                    let image: UIImage?
                    
                    if let newImage = self.cashedDataSource.object(forKey: imageURL as AnyObject) {
                        image = newImage
                    }
                    else {
                        
                        if let newImage = try? UIImage(data: Data(contentsOf: URL(string: imageURL!)!)) {
                            image = newImage
                            self.cashedDataSource.setObject(image!, forKey: imageURL as AnyObject)
                        } else {
                            image = nil
                        }
                    }
                    
                    let newCell = CellData(name: name, author: author, description: fullDescription, image: image, price: priceAtSring, url: viewUrl)
                    cellsArray.append(newCell)
                }
            }
        }
    }
    
    /// парсинг Json для форматат software
    ///
    /// - Parameters:
    ///   - data: json info
    ///   - cellsArray: массив данных, в который добовляем новую информацию
    func parseSoftware(data: Data, cellsArray: inout [CellData]) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        if let cells = json!["results"] as? NSArray {
            
            for cell in cells {
                
                if let cellInfo = cell as? [String: AnyObject] {
                  
                    let name = cellInfo["trackName"] as? String
                    let author = cellInfo["artistName"] as? String
                    let description = cellInfo["description"] as? String
                    let viewUrl = cellInfo["trackViewUrl"] as? String
                    let imageURL = cellInfo["artworkUrl60"] as? String
                    let price = cellInfo["price"] as? NSNumber
                    
                    let priceAtSring = String(Double(truncating: price ?? 0))
                    let image: UIImage?
                    
                    if let newImage = self.cashedDataSource.object(forKey: imageURL as AnyObject) {
                        image = newImage
                    }
                    else {
                        
                        if let newImage = try? UIImage(data: Data(contentsOf: URL(string: imageURL!)!)) {
                            image = newImage
                            self.cashedDataSource.setObject(image!, forKey: imageURL as AnyObject)
                        } else {
                            image = nil
                        }
                    }
                    
                    let newCell = CellData(name: name, author: author, description: description, image: image, price: priceAtSring, url: viewUrl)
                    cellsArray.append(newCell)
                }
            }
        }
    }
    
    /// парсинг Json для форматат AllArtist
    ///
    /// - Parameters:
    ///   - data: json info
    ///   - cellsArray: массив данных, в который добовляем новую информацию
    func parseAllArtists(data: Data, cellsArray: inout [CellData]) {
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        if let cells = json!["results"] as? NSArray {
            
            for cell in cells {
                
                if let cellInfo = cell as? [String: AnyObject] {
                    
                    let name = cellInfo["artistName"] as? String
                    let author = cellInfo["artistType"] as? String
                    let description = cellInfo["primaryGenreName"] as? String
                    let viewUrl = cellInfo["artistLinkUrl"] as? String
                    

                    
                    let newCell = CellData(name: name, author: author, description: description, image: nil, price: "0", url: viewUrl)
                    cellsArray.append(newCell)
                }
            }
        }
    }
    
    /// создание юрл на освнове выбранных настроек
    ///
    /// - Returns: часть ссылки, в которой указываются конкретны парметры для запроса
    func configureURL() -> String {
        
        var additionalString = ""
        
        if let currentAccountData = UserDefaults.standard.data(forKey: keyForCoding) {
            
            do {
                if let currentSettings  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(currentAccountData)  as? Settings {
                    let limitString = "&limit=\(currentSettings.searchLimit)"
                    let typeString = "&entity=\(currentSettings.mediaType)"
                    additionalString = limitString + typeString
                }
            } catch let error {
                print(error)
            }
        }
        return additionalString
    }
    
    /// возвращает указанный тип контента
    ///
    /// - Returns: тип контента
    func sendMediaType() -> String {
       
        var additionalString = ""
        
        if let currentAccountData = UserDefaults.standard.data(forKey: keyForCoding) {
            
            do {
                if let currentSettings  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(currentAccountData)  as? Settings {
                   
                    let typeString = currentSettings.mediaType
                    additionalString = typeString
                }
            } catch let error {
                print(error)
            }
        }
        return additionalString
    }
    
    func makeRequest(withText: String, complition: @escaping ([CellData])->())   {
        
        var cellsData = [CellData]()
        let searchString = withText.replacingOccurrences(of: " ", with: "+")
        
        
        if let url = URL(string: "\(baseUrl)\(searchString)\(configureURL())") {
            
            fail = false
            let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 20)
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: urlRequest, completionHandler: {
                (data, response, error) in
               
                if error != nil {
                    print("Error: \(String(describing: error?.localizedDescription))")
                }
                else if let data = data, data != Data(capacity: 0) {
                   
                    self.fail = false
                    switch self.sendMediaType() {
                   
                    case "movie":
                        self.parseMovie(data: data, cellsArray: &cellsData)
                    case "podcast":
                        self.parsePodcast(data: data, cellsArray: &cellsData)
                    case "musicTrack":
                        self.parseMusicTrack(data: data, cellsArray: &cellsData)
                    case "musicVideo":
                        self.parseMusicVideo(data: data, cellsArray: &cellsData)
                    case "audiobook":
                        self.parseAudioBook(data: data, cellsArray: &cellsData)
                    case "tvSeason":
                        self.parseTVShow(data: data, cellsArray: &cellsData)
                    case "software", "iPadSoftware":
                        self.parseSoftware(data: data, cellsArray: &cellsData)
                    case "allArtist":
                        self.parseAllArtists(data: data, cellsArray: &cellsData)
                    default:
                        break
                    }
                    
                    complition(cellsData)
                }
            })
            task.resume()
        } else {fail = true}
        
     }
}
