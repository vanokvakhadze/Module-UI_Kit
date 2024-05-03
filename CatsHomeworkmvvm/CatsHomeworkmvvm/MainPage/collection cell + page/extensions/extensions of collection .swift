//
//  extensions of collection .swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 01.05.24.
//

import UIKit


extension MainPageController:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemModel.Facts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell", for: indexPath) as! PageCell
        cells.backgroundColor = .systemGray3
        cells.layer.cornerRadius = 10
        let descriptionOfCats = itemModel.Facts[indexPath.row]
        cells.title.text = descriptionOfCats.fact
        return cells
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeader.identifer, for: indexPath) as! CollectionHeader
        
        header.configure()
        header.title.text = "CatFacts"
        return header
    }
    
  

}



