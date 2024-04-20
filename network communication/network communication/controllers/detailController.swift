//
//  detailContoler.swift
//  network communication
//
//  Created by vano Kvakhadze on 19.04.24.
//

import UIKit

class detailController: UIViewController {
    
    let safeArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleOfview: UILabel = {
        let label = UILabel()
        label.text = "Details"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timeOfnew: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textOfnews: UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .clear
        txt.font = .systemFont(ofSize: 14)
        return txt
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSafeArea()
        addTitle()
        addtime()
        addDescription()
    }


    func setupSafeArea(){
        view.addSubview(safeArea)
        let zones = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: zones.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: zones.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: zones.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: zones.bottomAnchor).isActive = true
    }
    
    func addTitle() {
        safeArea.addSubview(titleOfview)
        titleOfview.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 20).isActive = true
        titleOfview.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24).isActive = true
        titleOfview.widthAnchor.constraint(equalToConstant: 90).isActive = true
        titleOfview.heightAnchor.constraint(equalToConstant: 31).isActive = true
    }
    
    func addtime(){
        safeArea.addSubview(timeOfnew)
        //timeOfnew.topAnchor.constraint(equalTo: image.bottomAnchor,constant: 13).isActive = true
        timeOfnew.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 370).isActive = true
        timeOfnew.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24).isActive = true
        timeOfnew.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        
    }
    
    func addDescription(){
        safeArea.addSubview(textOfnews)
        textOfnews.topAnchor.constraint(equalTo: timeOfnew.bottomAnchor, constant: 26).isActive = true
        textOfnews.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        textOfnews.widthAnchor.constraint(equalToConstant: 303).isActive = true
        textOfnews.heightAnchor.constraint(equalToConstant: 287).isActive = true
        
        
    }
    
    

}

#Preview{
    detailController()
}
