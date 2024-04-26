//
//  extensios.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import UIKit

extension MainPageViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let inSearchMode = self.itemModel.inSearchMode(itemView.searchController)
        
        return inSearchMode ? self.itemModel.filteredCountry.count :
        itemModel.countriesArray.count
        
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.itemView.uiTable.dequeueReusableCell(withIdentifier: "countryCell") as? countryCell
        
        let searchMode = self.itemModel.inSearchMode(itemView.searchController)
        let country = searchMode ? self.itemModel.filteredCountry[indexPath.row] :
        self.itemModel.countriesArray[indexPath.row]
        
        cell?.updateCell(country: (country.name?.common)!, image: (country.flags?.png)!)
        cell!.layer.borderWidth = 1
        cell!.layer.cornerRadius = 25
        cell!.layer.borderColor = UIColor.lightGray.cgColor
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemModel.didSelectRowAt(index: indexPath)
    
//         let searchMode = self.itemModel.inSearchMode(itemView.searchController)
//
//        let country = searchMode ? self.itemModel.filteredCountry[indexPath.row] :
//        self.itemModel.countriesArray[indexPath.row]
//        
//        let detailsPageModel = DetailPageModel()
//        detailsPageModel.details = country
//        
//        let detailsViewModel = DetailPageViewModel(model: detailsPageModel)
//        
//        let detailsPageVC = DetailPageViewController(viewModel: detailsViewModel)
//        print("selected")
             
      //  navigationController?.pushViewController(detailsPageVC, animated: true)
        
    }
}
