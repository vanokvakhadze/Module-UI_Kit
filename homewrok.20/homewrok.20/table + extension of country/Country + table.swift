//
//  Country + table.swift
//  homewrok.20
//
//  Created by vano Kvakhadze on 21.04.24.
//


import UIKit

extension CountryVC:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
   
   
   
    
}

extension CountryVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = uiTable.dequeueReusableCell(withIdentifier: "countryCell") as? countryCell
        let country = countriesArray[indexPath.row]
        cell?.updateCell(country: (country.name?.common)!, image: (country.flags?.png)!)
        cell!.layer.borderWidth = 1
        cell!.layer.cornerRadius = 25
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsCountryVC()
        detailsVC.details = countriesArray[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
}
