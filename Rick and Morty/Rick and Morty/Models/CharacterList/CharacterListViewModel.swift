//
//  CharacterListViewModel.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    
    private (set) var dataSource: [CharacterCellViewState] = []
    private var characters: [Characters] = []
    private var currentPage = 1
    private let router: CharacterListRouter
    private let networkManager: NetworkManager
    
    weak var view: CharacterListViewController?
    
    init(router: CharacterListRouter, networkManager: NetworkManager = NetworkManager()) {
        self.router = router
        self.networkManager = networkManager
    }
    
    func viewDidLoad() {
        getCharacterList()
    }
    
    func prefetchRows(for indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            getCharacterList()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return (indexPath.row) >= dataSource.count - 1
    }
    
    private func getCharacterList() {
        networkManager.fetchData(page: currentPage, completionHandler: {
            characters in
            self.characters += characters
            self.dataSource += characters.map(CharacterConverter.convertToCell)
            self.currentPage += 1
            
            self.view?.reloadData()
        })
    }
    
    func didSelect(row: Int) {
        router.show(character: characters[row])
    }
}
