//
//  textFieldExtension.swift
//  DataPersistance.mvvm
//
//  Created by vano Kvakhadze on 26.04.24.
//

import UIKit

extension UITextField {
   static func customInput() ->  UITextField {
       let input  = UITextField()
       input.translatesAutoresizingMaskIntoConstraints = false
       input.widthAnchor.constraint(equalToConstant: 327).isActive = true
       input.heightAnchor.constraint(equalToConstant: 45).isActive = true
       input.layer.cornerRadius = 22.5
       input.layer.borderWidth = 1
       input.backgroundColor = .systemBackground
       return input
    }
}
