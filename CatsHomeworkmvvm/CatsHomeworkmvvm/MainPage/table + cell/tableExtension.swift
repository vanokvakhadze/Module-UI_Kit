//
//  tableExtension.swift
//  CatsHomeworkmvvm
//
//  Created by vano Kvakhadze on 03.05.24.
//

import UIKit


extension MainPageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemModel.breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedsCell") as? BreedsCell
        let breeds = itemModel.breeds[indexPath.row]
        cell?.breeds.text = breeds.breed
        cell?.country.text = breeds.country
        cell?.backgroundColor = .darkGray
        
        return cell ?? UITableViewCell()
    }
}
