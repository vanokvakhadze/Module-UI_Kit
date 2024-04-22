//
//  ViewController.swift
//  homewrok.20
//
//  Created by vano Kvakhadze on 21.04.24.
//

import UIKit

class CountryVC: UIViewController{
    var countriesArray = [Countries]()
    
    
    let safeZones: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let uiTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let tableHeader: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSafeZone()
        addTable()
        NetworkService().getCountrys(completion: {data, error in
            self.countriesArray = data.self ?? []
            //print(self.countriesArray)
            self.uiTable.reloadData()
        })
    }
    
    func addSafeZone(){
        view.addSubview(safeZones)
        let area = view.safeAreaLayoutGuide
        safeZones.topAnchor.constraint(equalTo: area.topAnchor).isActive = true
        safeZones.leadingAnchor.constraint(equalTo: area.leadingAnchor).isActive = true
        safeZones.trailingAnchor.constraint(equalTo: area.trailingAnchor).isActive = true
        safeZones.bottomAnchor.constraint(equalTo: area.bottomAnchor).isActive = true
    }
    
    func addTable(){
        safeZones.addSubview(uiTable)
        uiTable.topAnchor.constraint(equalTo: safeZones.topAnchor).isActive = true
        uiTable.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor ,constant: 21).isActive = true
        uiTable.trailingAnchor.constraint(equalTo: safeZones.trailingAnchor, constant: -27).isActive = true
        uiTable.bottomAnchor.constraint(equalTo: safeZones.bottomAnchor).isActive = true
        
        uiTable.separatorColor = .clear
        uiTable.delegate = self
        uiTable.dataSource = self
        uiTable.register(countryCell.self, forCellReuseIdentifier: "countryCell")
        //uiTable.tableHeaderView = tableHeader
//        let title = UILabel(frame: CGRect(x: 5, y: 5, width: 270, height: 30))
//         title.text = "Countries"
//         title.font = .boldSystemFont(ofSize: 20)
        //tableHeader.addSubview(title)
    }


}

#Preview{
    CountryVC()
}
