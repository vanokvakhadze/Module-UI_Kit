//
//  ViewController.swift
//  network communication
//
//  Created by vano Kvakhadze on 19.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    var panikebisArray = [Panicks]()
    
    let safeArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let header: UIView = {
        let view = UIView (frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSafeArea()
        setUpTableView()
       //getPanicks()
        GetObjects().panikebi(completion: { data, error in
            self.panikebisArray = data?.list ?? []
            self.table.reloadData()
        })
    }
    
    func setupSafeArea(){
        view.addSubview(safeArea)
        let zones = view.safeAreaLayoutGuide
        safeArea.topAnchor.constraint(equalTo: zones.topAnchor).isActive = true
        safeArea.leadingAnchor.constraint(equalTo: zones.leadingAnchor).isActive = true
        safeArea.trailingAnchor.constraint(equalTo: zones.trailingAnchor).isActive = true
        safeArea.bottomAnchor.constraint(equalTo: zones.bottomAnchor).isActive = true
    }
    
    func setUpTableView(){
        safeArea.addSubview(table)
        table.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25).isActive = true
        table.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24).isActive = true
        table.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
        table.tableHeaderView = header
        table.delegate = self
        table.dataSource = self
        table.register(NewsCell.self, forCellReuseIdentifier: "newsCell")
        table.tableHeaderView = header
        let title = UILabel(frame: CGRect(x: 5, y: 10, width: 329, height: 31))
         title.text = "Panika News"
         title.font = .boldSystemFont(ofSize: 20)
        header.addSubview(title)
        
    }
    

    

//    func getPanicks(){
//        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
//        let urlObject = URL(string: urlString)
//        let urlRequest = URLRequest(url: urlObject!)
//        
//        URLSession.shared.dataTask(with: urlRequest) {data, response, error in
//            let newsResponeData = try? JSONDecoder().decode(News.self, from: data!)
//            let news = newsResponeData?.List ?? []
//            self.panikebisArray = news
//            
//            DispatchQueue.main.sync {
//                self.table.reloadData()
//            }
//           // print(self.panikebisArray)
//                        
//        }.resume()
//    }

}

#Preview{

    ViewController()
}
