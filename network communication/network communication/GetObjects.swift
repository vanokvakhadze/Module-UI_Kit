//
//  GetObjects.swift
//  network communication
//
//  Created by vano Kvakhadze on 20.04.24.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

class GetObjects {
    
//    func getPanika(completion: @escaping (News?, Error?)-> (Void) ){
//        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
//        let urlObject = URL(string: urlString)
//        let urlRequest = URLRequest(url: urlObject!)
//        
//        URLSession.shared.dataTask(with: urlRequest) { data, respond, error in
//            let newResponseData = try? JSONDecoder().decode(News.self, from: data!)
//            
//            _ = newResponseData?.List ?? []
//            
//            DispatchQueue.main.sync{
//                completion(newResponseData, nil)
//            }
//            
//        }.resume()
//    }
    
        func panikebi(completion: @escaping (News?,Error?)->(Void)) {
    
            let urlsString = "https://imedinews.ge/api/categorysidebarnews/get"
            let url = URL(string: urlsString)!
    
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil, error)
                }
    
                guard let response = response as? HTTPURLResponse else {
                    completion(nil, NetworkError.wrongResponse)
                    return
                }
    
                guard (200...299).contains(response.statusCode) else {
                    completion(nil, NetworkError.wrongStatusCode(code: response.statusCode))
                    return
                }
    
                guard let data = data else {
                    return
                }
    
                do {
                    let decoder = JSONDecoder()
                    let panika = try decoder.decode(News.self, from: data)
    
                    DispatchQueue.main.async {
                        completion(panika, nil)
                    }
                } catch {
                    print("decoding error")
                }
            }.resume()
        }
        
    
}
