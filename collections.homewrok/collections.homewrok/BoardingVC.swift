//
//  BoardingVC.swift
//  collection
//
//  Created by vano Kvakhadze on 15.04.24.
//

import UIKit

class BoardingVC: UIViewController {
    let backGroundImage: UIImageView = {
        let img = UIImage(named: "boarding")
        let imgView = UIImageView(image: img)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    let safeArea: UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let startButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("დაწყება", for: .normal)
        return btn
    }()
    
    let text: UITextView = {
       let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.text = "შედი აპლიკაციაში და იწუწუნე რამდენიც გინდა"
        txt.backgroundColor = .none
        txt.textColor = .white
        txt.font = .systemFont(ofSize: 30)
        return txt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addbackGround()
        addSafeArea()
        addText()
        addStartButton()
        
    }
    func addbackGround(){
        view.insertSubview(backGroundImage, at: 0)
        backGroundImage.widthAnchor.constraint(equalToConstant: 400).isActive = true
        backGroundImage.heightAnchor.constraint(equalToConstant: 1000).isActive = true
    }
    func addSafeArea(){
        view.addSubview(safeArea)
        let guid = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: guid.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: guid.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: guid.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: guid.bottomAnchor).isActive = true
        
    }
    
    func addText(){
        safeArea.addSubview(text)
        text.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 382).isActive = true
        text.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 21).isActive = true
        text.widthAnchor.constraint(equalToConstant: 263).isActive = true
        text.heightAnchor.constraint(equalToConstant: 192).isActive = true
        
    }
    
    func addStartButton(){
        safeArea.addSubview(startButton)
        startButton.widthAnchor.constraint(equalToConstant: 123).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        startButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 664).isActive = true
        startButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 222).isActive = true
        startButton.backgroundColor = .blue
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
    }
    
    @objc func nextPage(){
        let VC = collectionVC()
        self.navigationController?.pushViewController(VC, animated: true)
        self.navigationController?.setViewControllers([VC], animated: true)
    }
    
}
    
#Preview{
        BoardingVC()
    }


