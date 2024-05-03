//
//  TableCell.swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 03.05.24.
//
import UIKit

class BreedsCell: UITableViewCell {
    let breeds: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        return label
    }()
    
    let country: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configuration()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration() {
        contentView.addSubview(breeds)
        breeds.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        breeds.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        contentView.addSubview(country)
        country.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20).isActive = true
        country.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
       
       
    }
    
    
}


