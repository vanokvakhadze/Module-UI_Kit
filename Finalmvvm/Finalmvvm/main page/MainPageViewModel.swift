//
//  MainPageViewModel.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import UIKit

protocol ViewModelDelegate: AnyObject{
    func countryUpdate(country: [Countries])
    func navigateDetailVC(country: Countries)
}

class MainPageViewModel {
    
    
    var countriesArray =  [Countries]()
    
    
    var filteredCountry: [Countries] = []
    
    weak var delegate: ViewModelDelegate?
    
    
    
    public func fetchData(){
        
        MainPageService().getCountrys(completion: {data, error in
            self.countriesArray = data.self ?? []
            //print(self.countriesArray)
            self.delegate?.countryUpdate(country: self.countriesArray)
        })
    }
    
    
    func updateView(){
        fetchData()
    }
    
    
    func didSelectRowAt(index: IndexPath){
      
            let searchMode = self.inSearchMode(MainPageView().searchController)
            searchMode ? delegate?.navigateDetailVC(country: filteredCountry[index.row]) : delegate?.navigateDetailVC(country: filteredCountry[index.row])
        
       
    }
                        
    
}

    //MARK: extensions view model

extension MainPageViewModel {
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        return isActive && !searchText.isEmpty
    }
    
    public func updateSearchController(searchBarText: String?) {
        self.filteredCountry = countriesArray
        if let searchText = searchBarText  {
            guard !searchText.isEmpty else {self.delegate?.countryUpdate(country: countriesArray); return }
            self.filteredCountry = self.countriesArray.filter({$0.name!.common!.contains(searchText)})
        }
        self.delegate?.countryUpdate(country: countriesArray)
    }
}
