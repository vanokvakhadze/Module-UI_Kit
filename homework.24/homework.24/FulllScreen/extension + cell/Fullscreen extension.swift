//
//  Fullscreen extension.swift
//  homework.24
//
//  Created by vano Kvakhadze on 09.05.24.
//

import Foundation
import UIKit

extension FullScreen: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemModel.allPhotos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "FullScreen", for: indexPath) as! FullscreenCell
        let photos = itemModel.allPhotos[indexPath.item]
        cells.updateCells(image: photos.urls.regular)
        cells.backgroundColor = .brown
        return cells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
