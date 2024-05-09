//
//  Fullscrenn Cell.swift
//  homework.24
//
//  Created by vano Kvakhadze on 09.05.24.
//

import UIKit

class FullscreenCell: UICollectionViewCell {
    let actorImage = UIImageView()
    let labelo: UILabel = {
        let lbl = UILabel()
        lbl.text = "egfger"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addPhotos()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPhotos(){
        addSubview(actorImage)
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
