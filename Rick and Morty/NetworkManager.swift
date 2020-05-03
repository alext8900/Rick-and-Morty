//
//  NetworkManager.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
class NetworkManager {
    
    var hasNextPage: Bool = true
    func fetchData(page: Int, completionHandler: @escaping (_ response: [Characters]) -> Void) {
        guard hasNextPage else { return }
        
        let baseURL = "https://rickandmortyapi.com/api/character/"
        
        let url = URL(string: "\(baseURL)/?page=\(page)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let results = try decoder.decode(Results.self, from: data)
                    self.hasNextPage = results.info.next != ""
                    
                    DispatchQueue.main.async {
                        completionHandler(results.results)
                    }
                } catch {
                    print("error decoding data: \(error)")
                }
            }
        }
        
        task.resume()
    }
}
