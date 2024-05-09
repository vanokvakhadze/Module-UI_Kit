//
//  FullScreen.swift
//  homework.24
//
//  Created by vano Kvakhadze on 09.05.24.
//

import UIKit

class FullScreen: UIViewController, FLViewModelDelegate {
    
    
  
    let collection: UICollectionView  = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        return  collection
    }()
    
    let safeArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var itemModel = FullSCViewModel()
    
    init() {
        self.itemModel = FullSCViewModel()
        super.init(nibName: nil, bundle: nil)
        itemModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ფოტოს რო დავაჭერთ წინა გვერდზე ჰო მაგ ფოტოდან უნდა დაეწყო და და ვერ და ვაერ გავაკეთე , ფოტოს ინდექსიც ,მოაქვს მარა

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSafeArea()
        addCollection()
        print(itemModel.indexOfphoto)
        scrollFromItem()
        //print("\(itemModel.allPhotos)")
        
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
        view.addSubview(collection)
        collection.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        collection.dataSource = self
        collection.delegate = self
        collection.isPagingEnabled = true
        collection.register(FullscreenCell.self, forCellWithReuseIdentifier: "FullScreen")
        //collection.scrollToItem(at: IndexPath(item: itemModel.indexOfphoto, section: 0), at: .centeredHorizontally, animated: false)
        
    }
    
    func scrollFromItem(){
        let indexPath = IndexPath(item: itemModel.indexOfphoto, section: 0)
        collection.layoutIfNeeded()
        collection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
    
    func updateView(photos: [PhotoUrls], selectedPhoto: Int) {
        itemModel.allPhotos = photos
        itemModel.indexOfphoto = selectedPhoto
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }

}
