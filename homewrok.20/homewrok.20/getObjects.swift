//
//  getObjects.swift
//  homewrok.20
//
//  Created by vano Kvakhadze on 22.04.24.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

class NetworkService {
    func getCountrys(completion: @escaping ([Countries]?, Error?)-> (Void)){
        let urlString = "https://restcountries.com/v3.1/all"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil,error)
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
                let country = try decoder.decode([Countries].self, from: data)
                
                DispatchQueue.main.async {
    
                    completion(country, nil)
                }
                
            }catch {
                print("decoding error")
            }
        }.resume()
    }
}
