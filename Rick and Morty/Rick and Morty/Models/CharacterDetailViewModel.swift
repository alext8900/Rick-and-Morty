//
//  CharacterDetailViewModel.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
final class CharactersDetailViewModel {
    let character: CharactersDetailsViewState
    
    init(character: Characters) {
        self.character = CharacterConverter.convertToDetails(from: character)
    }
}
