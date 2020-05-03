//
//  Character.swift
//  Rick and Morty
//
//  Created by Alex Thompson on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Characters: Codable {
  let id: Int
  let name: String
  let status: String
  let species: String
  let type: String
  let gender: String
  let origin: LocationModel?
  let location: LocationModel?
  let image: String
  let episode: [String]
  let url: String
  let created: String
  
  init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: LocationModel?, location: LocationModel?, image: String, episode: [String], url: String, created: String) {
    self.id = id
    self.name = name
    self.status = status
    self.species = species
    self.type = type
    self.gender = gender
    self.image = image
    self.episode = episode
    self.url = url
    self.created = created
    self.origin = origin
    self.location = location
  }
}

struct LocationModel: Codable {
  let name: String
  let url: String
}

struct InfoModel: Codable {
  let count: Int
  let pages: Int
  let next: String?
  let previous: String?
}

struct Results: Codable {
  let info: InfoModel
  let results: [Characters]
}

//struct Welcome: Codable {
//    let info: Info
//    let results: [Character]
//    let character: Character?
//}
//
//// MARK: - Info
//struct Info: Codable {
//    let count, pages: Int
//    let next: String
//    let prev: String
//}
//
//// MARK: - Result
//struct Character: Codable {
//    let id: Int
//    let name: String
//    let status: Status
//    let species: Species
//    let type: String
//    let gender: Gender
//    let origin, location: Location
//    let image: String
//    let episode: [String]
//    let url: String
//    let created: String
//}
//
//enum Gender: String, Codable {
//    case female = "Female"
//    case male = "Male"
//    case unknown = "unknown"
//}
//
//// MARK: - Location
//struct Location: Codable {
//    let name: String
//    let url: String
//}
//
//enum Species: String, Codable {
//    case alien = "Alien"
//    case human = "Human"
//}
//
//enum Status: String, Codable {
//    case alive = "Alive"
//    case dead = "Dead"
//    case unknown = "unknown"
//}
