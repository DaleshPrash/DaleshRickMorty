//
//  Character.swift
//  DaleshRickMorty
//
//  Created by DALESH PRASHAR on 1/29/25.
//

import Foundation

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

struct CharacterResponse: Codable {
    let results: [Character]
}
