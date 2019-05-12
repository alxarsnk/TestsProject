//
//  SearchViewController.swift
//  iTunesTests
//
//  Created by Александр Арсенюк on 27/03/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController, SearchViewInput {
    
    var output: SearchViewOutput!
    var manager = iTunesManager()
    var cellsData = [CellData]()
    
    let cellIdentifier = "cell"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
     }
   
    //MARK: - SearchViewInput
    
    func displayAlert(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func checkCurrentSettingsButton(_ sender: Any) {
        output.showSearchSettings()
    }
}
    //MARK: - TableView

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
     return cellsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SearchTableViewCell
        let newCell = cellsData[indexPath.row]
        cell.cinfigureCell(withModel: newCell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = cellsData[indexPath.row]
       
        if let url = URL(string: cell.url!) {
            let safariViewController = SFSafariViewController(url: url, configuration: .init())
            safariViewController.delegate = self as? SFSafariViewControllerDelegate
           present(safariViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text != nil && !searchBar.text!.isEmpty {
          
            
            manager.makeRequest(withText: searchBar.text!){ (requestedCellsData) in
                self.cellsData = requestedCellsData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
            }
        }
     }
     searchBar.resignFirstResponder()
        if manager.fail == true {
            output.showFailAlert()
        }
    }
}
