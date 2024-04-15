//
//  addWuwuni.swift
//  collection
//
//  Created by vano Kvakhadze on 15.04.24.
//

import UIKit

class addWuwuni: UIViewController {
    
    let images  = ["image1", "image2", "image3", "image4" ]
    
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
    
    let titleOf: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "სათაური"
        label.textColor  = .white
        return label
    }()
    
    let about: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "აღწერა"
        label.textColor  = .white
        return label
    }()
    
    
    let titleInput: UITextField = {
        let input = UITextField()
        input.placeholder = "მაგ. პანიკაა: დამხარება მჭრიდება"
        input.layer.cornerRadius = 10
        input.layer.borderColor = CGColor(red: 141, green: 141, blue: 141, alpha: 1)
        input.backgroundColor = UIColor(named: "Color")
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    let descriptInput: UITextField = {
        let input = UITextField()
        input.placeholder = "მაგ. ფიგმამ გაჭედა და ვინმემ გამომიგზავნეთ"
        input.layer.cornerRadius = 10
        input.translatesAutoresizingMaskIntoConstraints = false
        input.backgroundColor = UIColor(named: "Color")
        return input
    }()
    
    let icon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "აირჩიეთ აიქონი"
        label.textColor  = .white
        return label
    }()
    

    let collection: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: 40, height: 40)
        flow.minimumLineSpacing = 27
        flow.minimumInteritemSpacing = 27
        
        let collection = UICollectionView(frame: CGRect(x: 62, y: 313, width: 241, height: 50), collectionViewLayout: flow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .none
        return collection
    }()
    
    let addButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("დამატება", for: .normal)
        btn.backgroundColor = UIColor(named: "addButton")
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addbackGround()
        addSafeArea()
        addTitle()
        addDescript()
        addinput1()
        addinput2()
        addIcon()
        imageCollection()
        addelements()
        
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

    func addTitle(){
        safeArea.addSubview(titleOf)
        titleOf.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 71).isActive = true
        titleOf.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 43).isActive = true
        titleOf.widthAnchor.constraint(equalToConstant: 75).isActive = true
        titleOf.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    func addinput1(){
        safeArea.addSubview(titleInput)
        titleInput.topAnchor.constraint(equalTo: titleOf.bottomAnchor, constant: 3).isActive = true
        titleInput.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 33).isActive = true
        titleInput.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32).isActive = true
        titleInput.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func addDescript() {
        safeArea.addSubview(about)
        about.topAnchor.constraint(equalTo: titleOf.bottomAnchor,  constant: 59).isActive = true
        about.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 43).isActive = true
        about.widthAnchor.constraint(equalToConstant: 62).isActive = true
        about.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func addinput2(){
        safeArea.addSubview(descriptInput)
        descriptInput.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 3).isActive = true
        descriptInput.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 33).isActive = true
        descriptInput.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -33).isActive = true
        descriptInput.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func addIcon(){
        safeArea.addSubview(icon)
        icon.topAnchor.constraint(equalTo: descriptInput.bottomAnchor, constant: 29).isActive = true
        icon.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 43).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 142).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func imageCollection(){
        safeArea.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10),
            collection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 63),
            collection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -72),
            collection.heightAnchor.constraint(equalToConstant: 50)
        ])
        collection.dataSource = self
        collection.delegate = self
        collection.register(wuwuniCell.self, forCellWithReuseIdentifier: "wuwuning")
    }
    
    
    func addelements(){
        safeArea.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 132),
            addButton.heightAnchor.constraint(equalToConstant: 48),
            addButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -104)
        ])
        addButton.addTarget(self, action: #selector(updateelements), for:.touchUpInside)
       
    }
    
}

extension addWuwuni: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            images.count
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cells = collectionView.dequeueReusableCell(withReuseIdentifier: "wuwuning", for: indexPath) as! wuwuniCell
            let img = images[indexPath.row]
            cells.image.image = UIImage(named: img)
            return cells
        }
    
}

extension addWuwuni: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = images[indexPath.row]
        arrayOfphoto.append(selected)
        
        
    }
    
    @objc func updateelements(){
        guard let titles = titleInput.text else { return }
        guard let descript = descriptInput.text else { return }
        arrayOfText.append(descript)
        arrayOfTitle.append(titles)
        self.navigationController?.popViewController(animated: true)
 
    }
}

#Preview{
    addWuwuni()
}
