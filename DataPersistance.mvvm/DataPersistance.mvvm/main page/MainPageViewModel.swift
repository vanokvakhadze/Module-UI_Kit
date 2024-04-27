//
//  MainPageViewModel.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import UIKit
// ეს დელეგატი იმიტომ მაქვს რომ ვიუ კონტროლერიმში გადავცეთ მნიშვნელობები
protocol ViewModelDelegate: AnyObject{
    func countryUpdate(country: [Countries])
    func navigateDetailVC(country: Countries)
}

class MainPageViewModel {
    
    
    var countriesArray =  [Countries]()
    
    
    var filteredCountry: [Countries] = []
    
    weak var delegate: ViewModelDelegate?
    
    // აქ უბრალოდ მომაქვს ურლ იდან მნიშნელობა 
    
    public func fetchData(){
        
        MainPageService().getCountrys(completion: {data, error in
            self.countriesArray = data.self ?? []
            //print(self.countriesArray)
            self.delegate?.countryUpdate(country: self.countriesArray)
        })
    }
    
    // ეს ზუსტად რას შვება ვერ მივხვდი მეც ეს რო არ მიწერია ქვეყნებს არ აბრუნებს ისე 
    
    func updateView(){
        fetchData()
    }
    // აქ თეიბლის როუზე დაჭერისას რომელი ერეი გადასცეს ვიუ კონტროლერს
    // ანუ თუ სეარჩბარში რამეს ჩავწერთ და გაფილტრულს გადავცემთ თუ ჩვეულებრივს მასივს
    // აქ მაქ წვდომა ვიუ კონტროლერში სერჩბარი ჰო მიწერია და მაგ სერჩბარს ვიყენებ თუ არა
    // ამ ფუქნციას ასევე ვიძახებ ტეიბლის დიდ სელექტში 
    func didSelectRowAt(index: IndexPath){
      
            let searchMode = self.inSearchMode(MainPageView().searchController)
            searchMode ? delegate?.navigateDetailVC(country: filteredCountry[index.row]) : delegate?.navigateDetailVC(country: filteredCountry[index.row])
        
       
    }
                        
    
}

    //MARK: extensions view model   ამით უბრალოდ ვააქტიურებთ სერჩის
// ეს მეც ვერ გავიგე წესივრად რა არი ალბათ სერჩბარში რამე ხო არაა ჩაწერილი მაგას გვიბრუნებს
extension MainPageViewModel {
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        return isActive && !searchText.isEmpty
    }
    
    // აქ მაქ ორი მასივი ერთი ჩვეულებრივი ქვენების და მეორე უკვე გაფილტრული
    // აქ ის წერია ზუსტად რომ თუ შეიცავს შეყვანის ტექტს ქვეყნის სახელი იმ ქვეყნებს აბრუნებს
    // დელეგატში ჩაწერი ფუქნციას იმიტომ ვიძახებ რომ დააპდეთდესს ქვეყნების მასივი და
    
    public func updateSearchController(searchBarText: String?) {
        self.filteredCountry = countriesArray
        if let searchText = searchBarText  {
            guard !searchText.isEmpty else {self.delegate?.countryUpdate(country: countriesArray); return }
            self.filteredCountry = self.countriesArray.filter({$0.name!.common!.contains(searchText)})
        }
        self.delegate?.countryUpdate(country: countriesArray)
    }
}
