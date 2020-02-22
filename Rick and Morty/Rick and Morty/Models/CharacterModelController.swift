//
//  CharacterModelController.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

//Everything in this code is subject to change, alot of this is for experimental purposes to see if it'll work or not and if it doesnt than i will change it

enum HTTPMethod: String {
    case get = "GET"
}

enum NetworkError: Error {
    case badData
    case otherError
    case noDecode
    case noData
}

struct CharacterModelController {
    let characters: [Characters] = []
    let baseURL = URL(string: "https://rickandmortyapi.com/api/character")!
    let images: [URL] = []
    
    func fetchCharacters(characterName: String, completion: @escaping ((Result<Characters, Error>) -> Void)) {
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { possibleData, possibleResponse, possibleError in
            if let possibleError = possibleError {
                print("Error fetching characters: \(possibleError)")
                return
            }
            
            guard let possibleData = possibleData else {
                print("No data :(")
                return
            }
            
            do {
                let characterFetch = try JSONDecoder().decode(Characters.self, from: possibleData)
                
                completion(.success(characterFetch))
            } catch {
                print("Unable to decode data into Character type: \(possibleError ?? error)")
                return
            }
        }.resume()
    }
    
    func getImage(from imageURL: String, completion: @escaping(UIImage?) -> Void) {
        guard let imageURL = URL(string: imageURL) else {
            completion(nil)
            return }
        
        var request = URLRequest(url: imageURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching image: \(error)")
                return
            }
            
            guard let data = data else {
                print("Bad data for image: \(imageURL)")
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            
            completion(image)
        }.resume()
    }
}
