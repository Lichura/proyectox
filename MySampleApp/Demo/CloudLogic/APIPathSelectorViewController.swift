//
//  APIPathSelector.swift
//  MySampleApp
//
//
// Copyright 2016 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.8
//

import Foundation
import UIKit

protocol APIPathSelectorModalVCDelegate {
    func setSelectedValue(value : String)
}

class APIPathSelectorViewController: UITableViewController {

    var cloudLogicAPI: CloudLogicAPI?
    var paths: [String]?
    var pathSuggestions: [String]?
    var initialText: String?
    var delegate:APIPathSelectorModalVCDelegate!
    
    @IBOutlet weak var searchText: UITextField!
    
    func populatePathSuggestions() {
        pathSuggestions = []
        if let searchString = searchText.text {
            if let paths = paths {
                for path: String in paths {
                    if (path.lowercaseString.containsString(searchString.lowercaseString)) {
                        pathSuggestions?.append(path)
                    }
                }
            }
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchText.text = "/"
        paths = cloudLogicAPI?.paths
        populatePathSuggestions()
        
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        populatePathSuggestions()
    }
    
    @IBAction func onSelect(sender: AnyObject) {
        delegate.setSelectedValue(searchText.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let pathSuggestions = pathSuggestions else {return 0}
        return pathSuggestions.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PathTableCell", forIndexPath: indexPath) as! PathTableCell
        let path = pathSuggestions![indexPath.section]
        cell.path.text = path
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        searchText.text = pathSuggestions![indexPath.section]
    }
}

class PathTableCell: UITableViewCell {
    @IBOutlet weak var path: UILabel!
}
