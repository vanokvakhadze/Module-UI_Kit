//
//  wuwuniCell.swift
//  collection
//
//  Created by vano Kvakhadze on 15.04.24.
//

import UIKit

class wuwuniCell: UICollectionViewCell {
    let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI(){
        addSubview(image)
        image.topAnchor.constraint(equalTo: topAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.translatesAutoresizingMaskIntoConstraints = false
    }
}
