//
//  DataManager.swift
//  Diggle
//
//  Created by 노우영 on 2023/11/13.
//  Copyright © 2023 DiggleAjou. All rights reserved.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    func storeAccessToken(_ token: String) {
        UserDefaults.standard.setValue(token, forKey: DataKey.accessToken.rawValue)
    }
    
    func getAccessToken() throws -> String {
        let result = UserDefaults.standard.string(forKey: DataKey.accessToken.rawValue)
        guard let result = result
        else { throw DataError.empty }
        return result
    }
}
