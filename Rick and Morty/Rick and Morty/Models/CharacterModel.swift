//
//  CharacterModel.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct Characters: Codable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let origin: [OriginInfo]
    let location: [LocationInfo]
    let image: String

    struct OriginInfo: Codable, Equatable {
        let origin: Origin

        struct Origin: Codable, Equatable {
            let name: String
        }
    }

    struct LocationInfo: Codable, Equatable {
        let location: Location

        struct Location: Codable, Equatable {
            let name: String
        }
    }
}
