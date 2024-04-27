//
//  LoginPageService.swift
//  DataPersistance.mvvm
//
//  Created by vano Kvakhadze on 27.04.24.
//

import Foundation

class LoginPageService {
    
    
    
    enum KeyChainError: Error {
        case sameItemFound
        case unknown
        case nosuchDataFound
        case KCErrorWithCode(Int)
    }
  
    //⬇️SAVE data
    
    func save(
        service: String,
        account: String,
        password: Data
    ) throws {
        // service account password class
        let query: [String: AnyObject] = [
            kSecClass as String         : kSecClassGenericPassword,
            kSecAttrService as String   : service as AnyObject,
            kSecAttrAccount as String   : account as AnyObject,
            kSecValueData as String     : password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainError.sameItemFound
        }
        ///......
        guard status == errSecSuccess else {
            throw KeyChainError.unknown
        }
        
        print("saved")
    }
    
    
}
