//
//  ViewController.swift
//  collection
//
//  Created by vano Kvakhadze on 14.04.24.
//

import UIKit

class collectionVC: UIViewController {

    let backGroundImage: UIImageView = {
        let img = UIImage(named: "backGroundimage")
        let imgView = UIImageView(image: img)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    
    let safeArea: UIView  = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collection: UICollectionView = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.minimumLineSpacing = 20
        collectionFlow.minimumInteritemSpacing = 20
        collectionFlow.scrollDirection = .vertical
        collectionFlow.itemSize = CGSize(width: 156, height: 192)
        let collections = UICollectionView(frame: CGRect(x: 0, y: 0, width: 327, height: 192), collectionViewLayout: collectionFlow)
        collections.translatesAutoresizingMaskIntoConstraints = false
        collections.backgroundColor = .none
        return collections
    }()
    
    let nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 20
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addbackGround()
        addSafeArea()
        addCollection()
        nextBtn()
    }
    
    func addbackGround(){
        view.insertSubview(backGroundImage, at: 0)
        backGroundImage.widthAnchor.constraint(equalToConstant: 600).isActive = true
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
    
    func addCollection(){
        safeArea.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            collection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            collection.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -200)
        ])
        collection.register(elementsCell.self, forCellWithReuseIdentifier: "elementsCell")
        collection.dataSource = self
        collection.reloadData()
        print(arrayOfText)
        print(arrayOfTitle)
        //collection.delegate = self
        
    }
    
    func nextBtn(){
        safeArea.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 290),
            nextButton.heightAnchor.constraint(equalToConstant: 48),
            nextButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -104)
        ])
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
    }
}
extension collectionVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfText.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "elementsCell", for: indexPath) as! elementsCell
        let title = arrayOfTitle[indexPath.row]
        let text = arrayOfText[indexPath.row]
        let images = arrayOfphoto[indexPath.row]
        cells.title.text = title
        cells.text.text = text
        cells.image.image = UIImage(named: images)
        cells.layer.cornerRadius  = 10
        cells.backgroundColor = UIColor(named: "Color")
        collectionView.reloadData()
        return cells
    }
    
    
    @objc func nextPage() {
        let wuwuni = addWuwuni()
        self.navigationController?.pushViewController(wuwuni, animated: true)
    }
    
}


#Preview{
    collectionVC()
}
