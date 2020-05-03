//
//  CharacterConverter.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct CharacterCellViewState {
    let name: String
    let type: String
    let imageUrl: URL?
}

struct CharactersDetailsViewState {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: String
    let location: String
    let imageUrl: URL?
}

final class CharacterConverter {
    static func convertToCell(from model: Characters) -> CharacterCellViewState {
        let origin = model.origin?.name ?? "Unknown location"
        let type = "\(model.species) from \(origin)"
        
        return CharacterCellViewState(name: model.name, type: type, imageUrl: URL(string: model.image))
    }
    
    static func convertToDetails(from model: Characters) -> CharactersDetailsViewState {
        return CharactersDetailsViewState(name: model.name, status: model.status, species: model.species, gender: model.gender, origin: model.origin?.name ?? "Unknown", location: model.location?.name ?? "Unknown", imageUrl: URL(string: model.image))
    }
}
