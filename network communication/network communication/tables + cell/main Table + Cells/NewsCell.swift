//
//  NewsCell.swift
//  network communication
//
//  Created by vano Kvakhadze on 19.04.24.
//

import UIKit

class NewsCell: UITableViewCell {
    let textOfnews: UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.textColor = .black
        txt.backgroundColor = .clear
        return txt
    }()
    
    let timeOfnews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imediIMage = UIImageView()
    
    var imageName: String?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configuration()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration() {
        contentView.addSubview(timeOfnews)
        timeOfnews.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        timeOfnews.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        
        contentView.addSubview(textOfnews)
        textOfnews.topAnchor.constraint(equalTo: timeOfnews.bottomAnchor, constant: 5).isActive = true
        textOfnews.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        textOfnews.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6).isActive = true
        textOfnews.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        contentView.addSubview(imediIMage)
        
    }
    
    
}
