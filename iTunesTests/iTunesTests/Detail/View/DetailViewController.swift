//
//  DetailViewController.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit
import SafariServices
import WebKit

class DetailViewController: UIViewController, DetailViewInput {
    
    var output: DetailViewOutput!
    
    @IBOutlet weak var detailWebKit: WKWebView!
    var model: CellData?
    
    //MARK: - Методы
    override func loadView() {
        super.loadView()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let myURL = URL(string: model!.url!)!
        let myRequest = URLRequest(url: myURL)
        detailWebKit.load(myRequest)
        
    }
    
    //MARK: - DetailViewInput
    
    
}
