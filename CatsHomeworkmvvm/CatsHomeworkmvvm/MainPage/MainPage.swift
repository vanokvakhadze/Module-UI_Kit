//
//  ViewController.swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 01.05.24.
//

import UIKit

class MainPageController: UIViewController, ViewModelDelegate {
    
   
    
    var itemModel: MainViewModel
    
   //MARK: init
    init() {
        
        self.itemModel = MainViewModel()
        super.init(nibName: nil, bundle: nil)
        itemModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backGroundImg: UIImageView = {
        let img = UIImage(named: "cat2")
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let safeArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collection: UICollectionView = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.minimumLineSpacing = 40
        //collectionFlow.minimumInteritemSpacing = 20
        collectionFlow.scrollDirection = .horizontal
        collectionFlow.itemSize = CGSize(width: 146, height: 160)
        collectionFlow.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0)
        collectionFlow.headerReferenceSize = CGSize(width: 10, height: 20)
        
        let collection = UICollectionView(frame: CGRect(x: 0, y: 10, width: 400, height: 400), collectionViewLayout: collectionFlow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .none
        return collection
    }()
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.cornerRadius = 5
        return table
    }()
  
    let tableHeader: UIView = {
        let view = UIView (frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .systemBackground
        backGroundImage()
        addSafeZone()
        addcollectionView()
        setUpTableView()
        itemModel.updateFacts()
        itemModel.updateBreeds()
        
    }
    func backGroundImage(){
        view.insertSubview(backGroundImg, at: 0)
        backGroundImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backGroundImg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backGroundImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    //MARK: ADD SAFE AREA
    func addSafeZone(){
        view.addSubview(safeArea)
        let area = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: area.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: area.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: area.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: area.bottomAnchor).isActive = true
        safeArea.translatesAutoresizingMaskIntoConstraints = false
        //safeArea.backgroundColor = .systemBackground
    }
//MARK: ADD collection
    
    func addcollectionView() {
        safeArea.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            collection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            collection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            collection.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 1/2, constant: -170 )
        ])
        
        collection.register(PageCell.self, forCellWithReuseIdentifier: "PageCell")
        collection.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeader.identifer)
        
        collection.dataSource = self
        collection.reloadData()
    }
    
    //MARK: ADD table
    
    func setUpTableView(){
        safeArea.addSubview(table)
        table.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 30).isActive = true
        table.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25).isActive = true
        table.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24).isActive = true
        table.heightAnchor.constraint(equalToConstant: 210 ).isActive = true
        table.backgroundColor = .none
        table.tableHeaderView = tableHeader
        table.dataSource = self
        table.register(BreedsCell.self, forCellReuseIdentifier: "BreedsCell")
        let title = UILabel(frame: CGRect(x: 5, y: 10, width: 329, height: 31))
         title.text = "Cats Breed"
         title.font = .boldSystemFont(ofSize: 20)
        tableHeader.addSubview(title)
        
    }
    
  
    
    //MARK: confrim facts delegates
    func fetchedFacts(facts: [CatFacts]) {
        itemModel.Facts = facts
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
    
    func fetchBreedss(breed: [Breeds]) {
        itemModel.breeds = breed
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
}




#Preview{
    MainPageController()
}
