//
//  CharacterModelController.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethod: String {
    case get = "GET"
}

struct CharacterModelController {
    let characterList: [Character] = []
    let baseURL = URL(string: "https://rickandmortyapi.com/api/character")!
    
}
