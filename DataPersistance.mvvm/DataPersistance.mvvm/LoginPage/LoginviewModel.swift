//
//  LoginviewMode.swift
//  DataPersistance.mvvm
//
//  Created by vano Kvakhadze on 27.04.24.
//

import UIKit
import SwiftUI 
protocol viewModelDelegate: AnyObject {
    func viewUpdate(user: String, password: String, repassword: String)
}

class LoginPageViewModel: viewModelDelegate {
    
    var isLogged = true
    var alert = UIAlertAction(title: "ჰელლო", style: .default)
   
    var count: Int = 0 {
        didSet{
            UserDefaults.standard.set(count, forKey: "Count")
        }
    }
    
    
    
    weak var delegate: viewModelDelegate?
    
    func viewUpdate(user: String, password: String, repassword: String) {
        if password == repassword {
            do {
                try LoginPageService().save(
                    service: "Country service",
                    account: user,
                    password: password.data(using: .utf8) ?? Data()
                )
                logginCount()
                print("succses")
            } catch {
                print("error")
            }
        } else {
            print("პაროლები არ ემთხვევა")
        }
    }
    
    func logginCount(){
        if isLogged  {
            count += 1
            if count == 1 {
                LoginPageController().sendAlert(message: "ველქამთუ სვანეთი", title: "ჰელლო")
            }
            print(count)
        }
    }

 
 
    
}
