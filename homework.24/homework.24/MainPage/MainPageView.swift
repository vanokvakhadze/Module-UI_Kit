//
//  ViewController.swift
//  homework.24
//
//  Created by vano Kvakhadze on 08.05.24.
//

import UIKit
import SwiftUI

class MainPageViewController: UIViewController {
    
    
    
    var itemModel: MainViewModel
    
    init(){
        self.itemModel = MainViewModel()
        super.init(nibName: nil, bundle: nil)
        itemModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let safeArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleOfmain: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "title"
        return label
    }()
    
    let collection: UICollectionView  = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        return  collection
    }()

//    typealias DataSource = UICollectionViewDiffableDataSource<Section, PhotoUrls>
//    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, PhotoUrls>
//    
//    private var daraSource: DataSource!
//    private var snapshot = DataSourceSnapshot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSafeArea()
        addTitle()
        addCollection()
        itemModel.updateview()
        
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
        safeArea.addSubview(titleOfmain)
        titleOfmain.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        titleOfmain.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
    }
    func addCollection(){
        safeArea.addSubview(collection)
        collection.topAnchor.constraint(equalTo: titleOfmain.bottomAnchor,constant: 5).isActive = true
        collection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCell.self, forCellWithReuseIdentifier: "PhotosCell")
        
    }
    


}

extension MainPageViewController: MainViewModelDelegate{
    func updatephotos(photos: [PhotoUrls]) {
        itemModel.photosArray = photos
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
}
