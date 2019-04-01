//
//  SearchTableViewCell.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    /// скофигурировать ячейку
    ///
    /// - Parameter withModel: инфа о ячейке
    func cinfigureCell(withModel: CellData) {
        
        avatarImage.image = withModel.image
        nameLabel.text = withModel.name
        costLabel.text = String("\(withModel.price)$")
        authorName.text = withModel.author
        descriptionLabel.text = withModel.description
        
    }
}
