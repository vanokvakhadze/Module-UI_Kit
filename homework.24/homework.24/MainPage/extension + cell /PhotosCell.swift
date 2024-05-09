//
//  PhotosCell.swift
//  homework.24
//
//  Created by vano Kvakhadze on 08.05.24.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    
    let actorImage = UIImageView()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addPhotos()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPhotos(){
        addSubview(actorImage)
        //addSubview(label)
        actorImage.contentMode = .scaleAspectFill
        actorImage.clipsToBounds = true
        actorImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        actorImage.topAnchor.constraint(equalTo: topAnchor),
        actorImage.leadingAnchor.constraint(equalTo: leadingAnchor),
        actorImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        actorImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    func updateCells(image: String){
        if let imgURL = URL(string: image){
            actorImage.loadImage(from: imgURL)
        }
    }
}
