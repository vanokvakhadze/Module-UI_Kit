//
//  ViewController.swift
//  UITables
//
//  Created by vano Kvakhadze on 12.04.24.
//

import UIKit

class ViewController: UIViewController {

    
    
    let safeArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tables: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
 
    let header:  UIView = {
        let view = UIView (frame: CGRect(x: 0, y: 0, width: 300, height: 120))
    
        return view
    }()
    
  
  
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSafeArea()
        addTabeleView()
      
    }
    
    func addSafeArea(){
        self.view.addSubview(safeArea)
        let safeZones = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: safeZones.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: safeZones.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: safeZones.bottomAnchor).isActive = true
    }
    
    func addTabeleView(){
        safeArea.addSubview(tables)
        tables.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tables.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tables.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        tables.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        

        
        tables.dataSource = self
        tables.tableHeaderView = header
        let title = UILabel(frame: CGRect(x: 5, y: 10, width: 329, height: 41))
         title.text = "IOS SQUAD"
         title.font = .boldSystemFont(ofSize: 20)
        
        
        let owner = UILabel(frame: CGRect(x: 80, y: 75, width: 300, height: 30))
         owner.text = "Vano Kvakhadze"
         owner.font  = .systemFont(ofSize: 20)
        
        
        let myCustomView = UIImageView(frame: CGRect(x: 4, y: 60, width: 60, height: 60))
        let myImage: UIImage = UIImage(named: "me")!
        myCustomView.image = myImage
        myCustomView.layer.cornerRadius = 100
        
        header.addSubview(title)
        header.addSubview(owner)
        header.addSubview(myCustomView)
    }
    

   
    

}
#Preview{
    ViewController()
}
