//
//  ViewController + Table.swift
//  UITables
//
//  Created by vano Kvakhadze on 12.04.24.
//

import UIKit



extension ViewController: UITableViewDataSource {
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        firtsCharacters
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        firtsCharacters[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        firtsCharacters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell =  UITableViewCell()
        cell.textLabel?.text = developers[indexPath.row].capitalized
        return cell
    }
    
}




