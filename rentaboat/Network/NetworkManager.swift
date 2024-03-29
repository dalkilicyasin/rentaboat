//
//  NetworkManager.swift
//  rentaboat
//
//  Created by yasin on 25.03.2024.
//

import Foundation
import UIKit

enum ErrorHandling: Error {
    case serviceFault
    case decodeFault
    
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
     func callLocationList<T:Codable>(type: T.Type, chosenLocation: String, complation: @escaping((Result<T,ErrorHandling>) -> Void)) {
        guard let fileLocation = Bundle.main.url(forResource: "\(chosenLocation)", withExtension: "json") else {return}
        
        do {
            let data = try? Data(contentsOf: fileLocation)
            let result = try JSONDecoder().decode(T.self, from: data!)
            complation(.success(result))
        } catch {
            complation(.failure(ErrorHandling.decodeFault))
        }
    }
}



