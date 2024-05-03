//
//  MainViewModel.swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 01.05.24.
//



import UIKit
import FetchCats
import CatBreeds


protocol ViewModelDelegate: AnyObject {
    func fetchedFacts(facts: [CatFacts])
    func fetchBreedss(breed: [Breeds])
}

class MainViewModel {
    
    var Facts = [CatFacts]()
    //print(Facts)
    
    var breeds = [Breeds]()

    let cats = PacketCats()
    
    let catBreed = BreedPacket()
   
    weak var delegate: ViewModelDelegate?
    
   private func fetchData() {
       let urlString = "https://catfact.ninja/facts?limit=20"
       
       cats.getData(urlString: urlString) { [self] (result: Result<Cats ,Error>) in
            switch result {
            case .success(let success):
                self.Facts = success.data
                delegate?.fetchedFacts(facts: self.Facts)
                print(self.Facts)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    
    //MARK: fetch Breed
    
    private func fetchBreed() {
        let urlString = "https://catfact.ninja/breeds?limit=20"
        
        catBreed.getData(urlString: urlString) { [self] (result: Result<CatsBreed, Error>) in
             switch result {
             case .success(let success):
                 self.breeds = success.data
                 delegate?.fetchBreedss(breed: self.breeds)
                 print(self.Facts)
             case .failure(let failure):
                 print(failure.localizedDescription)
             }
         }
     }
    
    
    
    //MARK:
    func updateFacts(){
        fetchData()
    }
    
    //MARK:
    func updateBreeds(){
        fetchBreed()
    }
}
