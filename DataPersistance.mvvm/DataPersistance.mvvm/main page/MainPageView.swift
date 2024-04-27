//
//  ViewController.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import UIKit


class MainPageView:  UIView{
    
    
    let safeZones: UIView
    
    let uiTable: UITableView
     
    let searchController: UISearchController
    
    
    override init(frame: CGRect) {
        safeZones = UIView()
        searchController = UISearchController(searchResultsController: nil)
        uiTable = UITableView()
        
        super.init(frame: frame)
        
        addSafeZone()
        addTable()
        setUpSearchController()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func addSafeZone(){
        self.addSubview(safeZones)
        let area = self.safeAreaLayoutGuide
        safeZones.topAnchor.constraint(equalTo: area.topAnchor).isActive = true
        safeZones.leadingAnchor.constraint(equalTo: area.leadingAnchor).isActive = true
        safeZones.trailingAnchor.constraint(equalTo: area.trailingAnchor).isActive = true
        safeZones.bottomAnchor.constraint(equalTo: area.bottomAnchor).isActive = true
        safeZones.translatesAutoresizingMaskIntoConstraints = false
        safeZones.backgroundColor = .systemBackground
       
    }
    
    func addTable(){
        safeZones.addSubview(uiTable)
        uiTable.topAnchor.constraint(equalTo: safeZones.topAnchor).isActive = true
        uiTable.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor ,constant: 21).isActive = true
        uiTable.trailingAnchor.constraint(equalTo: safeZones.trailingAnchor, constant: -27).isActive = true
        uiTable.bottomAnchor.constraint(equalTo: safeZones.bottomAnchor).isActive = true
        uiTable.translatesAutoresizingMaskIntoConstraints = false 
        
        uiTable.separatorColor = .clear
        uiTable.register(countryCell.self, forCellReuseIdentifier: "countryCell")
        
       
     
    }
    
    func setUpSearchController(){
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        
        
    }
}



class MainPageViewController: UIViewController , ViewModelDelegate {
    
    var itemView: MainPageView
    var itemModel: MainPageViewModel
    
    init() {
        self.itemView = MainPageView()
        self.itemModel = MainPageViewModel()
        super.init(nibName: nil, bundle: nil)
        itemModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = itemView
        view.backgroundColor = .systemBackground
       
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        // აქ ეს საჭიროა  ისე ვერ იმუშავებს თეიბლები და სერჩბარი 
        itemView.uiTable.delegate = self
        itemView.uiTable.dataSource = self
        itemView.searchController.searchResultsUpdater = self
        
        
        setUptitle()
        
        // აქ რო არ მიწერია არ აჩენს ქვეყნებს და ვერ მივხვდი ზუსტად შინაარს
        itemModel.fetchData()
        
        
    }
    
    //MARK: countryviewModel Delegate
    
    // აქ კი ხდება დელეგატის მიღება თუ რაღაც და აპდეითი თეიბლის ისე არ გამოჩნდება ქვეყნების მასივი
    
    func countryUpdate(country: [Countries]) {
        itemModel.countriesArray = country
        DispatchQueue.main.async {
            self.itemView.uiTable.reloadData()
        }
    }
    
    //MARK: navigate to detail VC
    // რაც ვიუმოუდში მეწერა ის აკეთებს იმას რომ ან ქვეყნებს გადასცემს ან გაფილტრულ ქვეყენებს აქ კი
    // შემდეგ ვიუკონტროლერს ვაწვდი ინფორმაციას
    // ზუსტად რა როგორ ხდება ვერ ვხსნი ვასოს მაგალითიდან გადავაკეთე ეს
    
    func navigateDetailVC(country: Countries) {
        let detailsPageModel = DetailPageModel()
        detailsPageModel.details = country
        
        let detailsViewModel = DetailPageViewModel(model: detailsPageModel)
        
        let detailsPageVC = DetailPageViewController(viewModel: detailsViewModel)
        
        navigationController?.pushViewController(detailsPageVC, animated: true)
    }
    


    func setUptitle(){
         navigationController?.navigationBar.prefersLargeTitles = true
                 navigationItem.largeTitleDisplayMode = .always
                 navigationItem.title = "Title"
        
        navigationItem.searchController = itemView.searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
     }

}

