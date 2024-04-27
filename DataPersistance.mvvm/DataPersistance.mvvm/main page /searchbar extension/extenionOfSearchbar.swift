//
//  extenionOfSearchbar.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import UIKit

extension MainPageViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        itemModel.updateSearchController(searchBarText: searchController.searchBar.text)
    }
}
