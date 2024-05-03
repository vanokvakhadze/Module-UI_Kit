//
//  LoginPageViewCollectionViewCell.swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 01.05.24.
//

import UIKit

class PageCell: UICollectionViewCell {
    var title: UITextView  = {
        let label = UITextView ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpUI(){
        addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.widthAnchor.constraint(equalToConstant: 116),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
        
        
       
  }



}
