//
//  view+tables.swift
//  network communication
//
//  Created by vano Kvakhadze on 19.04.24.
//

import UIKit
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        panikebisArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "newsCell") as? NewsCell
        let currentNews = panikebisArray[indexPath.row]
        cell?.timeOfnews.text = currentNews.time
        cell?.textOfnews.text = currentNews.title
        //cell?.backgroundView = UIima
        cell?.backgroundColor = .gray
        cell?.layer.cornerRadius = 10
        
        

    
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentNews = panikebisArray[indexPath.row]
        let detailsVC = detailController()
        detailsVC.timeOfnew.text = currentNews.time
        detailsVC.textOfnews.text = currentNews.title
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    

}


extension ViewController: UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
        108
        }
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }
    
    
    
    
    
    
    }
extension UIImageView {
    func load(url: URL){
        DispatchQueue.global().async { [weak self ] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.sync {
                        self?.image = image
                    }
                }
            }
        }
    }
}
