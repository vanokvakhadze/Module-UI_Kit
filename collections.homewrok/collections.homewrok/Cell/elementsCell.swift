//
//  elementsCell.swift
//  collection
//
//  Created by vano Kvakhadze on 14.04.24.
//

import UIKit

class elementsCell: UICollectionViewCell {
    
     let image = UIImageView()
     var imageName: String?
    
    let title: UITextView  = {
        let label = UITextView ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    let text: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .clear
        text.font = .systemFont(ofSize: 10)
        return text
    }()
    
//    let stack: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
   
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
            title.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            title.widthAnchor.constraint(equalToConstant: 116),
            title.heightAnchor.constraint(lessThanOrEqualToConstant: 72),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
        
        
        addSubview(text)
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: title.bottomAnchor),
            text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            text.widthAnchor.constraint(equalToConstant: 116),
            text.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ])
        
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        addSubview(stack)
//        stack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 12).isActive = true
//        stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
//        stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        stack.heightAnchor.constraint(equalToConstant: 102).isActive = true
//        addelementOfstack()
  }
    
//    func addelementOfstack(){
//       
//        stack.addArrangedSubview(title)
//        stack.addArrangedSubview(text)
//    }
}
