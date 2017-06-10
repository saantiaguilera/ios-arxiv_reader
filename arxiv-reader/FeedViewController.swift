//
//  FeedViewController.swift
//  arxiv-reader
//
//  Created by Santiago Aguilera on 6/9/17.
//  Copyright © 2017 Santiago Aguilera. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController, UISearchResultsUpdating {
    
    let tableData = ["One","Two","Three","Four"]
    let cellIdentifier = "CellId"
    
    var filteredTableData = [String]()
    
    var searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a search controller and add it as a header of the tableview
        self.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Register the identifier for cells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        // Add a refresh control
        setRefreshControl()
        
        // Reload the table
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        self.refreshControl = refreshControl
    }
    
    func onRefresh() {
        
    }
    
    // From UISearchResultsUpdating
    
    public func updateSearchResults(for searchController: UISearchController) {
        // Do something with the searchController.searchBar.text
    }
    
    // From UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(tableData.count)
    }
    
    override func tableView(_ tableView: UITableView,
            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let cellValue = tableData[indexPath.row]
        
        tableViewCell.textLabel?.text = cellValue
        
        return tableViewCell
    }
    
    // From UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do something when picked
    }

    
}
