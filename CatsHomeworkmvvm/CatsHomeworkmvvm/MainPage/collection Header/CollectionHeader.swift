//
//  CollectionHeader.swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 02.05.24.
//

import UIKit

class CollectionHeader: UICollectionReusableView {
    
    static let identifer = "CollectionHeader"
    
    let title: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    
    public func configure(){
        addSubview(title)
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        title.frame = bounds
    }
}
