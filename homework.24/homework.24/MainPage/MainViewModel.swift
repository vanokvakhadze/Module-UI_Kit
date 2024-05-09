//
//  MainViewModel.swift
//  homework.24
//
//  Created by vano Kvakhadze on 08.05.24.
//


//MARK: ჩემს პაკეტებს რაღაც ჭირს და ვერ ვიყენებ :დ ამიტომ ნეთვორქინგი გამოვიყენე

import Foundation


protocol MainViewModelDelegate: AnyObject {
    func updatephotos(photos: [PhotoUrls])
}

class MainViewModel {
    var photosArray = [PhotoUrls]()
    private let token = "2ICUuVa22ts8DQPBxGdAlFIeBsL1eYWUgDZR07POns0" 
    var text: String = "food"
    
    weak var delegate: MainViewModelDelegate?
    
   private func fetchPhotos(){
        let urlString = "https://api.unsplash.com/search/photos?client_id=\(token)&query=\(text)"
        
            Networking().getData(urlString: urlString) { [self] (result: Result<ResultOfImages ,Error>) in
                switch result {
                case .success(let success):
                    self.photosArray = success.results
                    delegate?.updatephotos(photos: self.photosArray)
                    //print(self.photosArray)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
    }
    
    func updateview(){
        fetchPhotos()
    }
}


