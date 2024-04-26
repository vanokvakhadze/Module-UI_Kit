//
//  ountryCell.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import UIKit

class countryCell: UITableViewCell {
    
    let countryName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let countryImage = UIImageView()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConfig(){
        contentView.addSubview(backView)
       
        backView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
       // backView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true

        
        backView.addSubview(countryName)
        countryName.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        countryName.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -14).isActive = true
        
        backView.addSubview(countryImage)
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        countryImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 24).isActive = true
        countryImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        countryImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        countryImage.layer.cornerRadius = 3
        countryImage.contentMode = .scaleAspectFill
        countryImage.layer.masksToBounds = true
       
    }
    
    
    func updateCell(country: String, image: String){
        countryName.text = country
        if let imgURl = URL(string: image){
            countryImage.loadImage(from: imgURl)
        }
    }
}
