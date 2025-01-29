//
//  CharacterAPI.swift
//  DaleshRickMorty
//
//  Created by DALESH PRASHAR on 1/29/25.
//

import Foundation

class CharacterAPI {
    static let shared = CharacterAPI()

    private let baseURL = URL(string: "https://rickandmortyapi.com/api/")!

    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        let url = baseURL.appendingPathComponent("character")

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedResponse.results))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
