//
//  CharacterViewModel.swift
//  DaleshRickMorty
//
//  Created by DALESH PRASHAR on 1/29/25.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()

    func fetchCharacters() {
        isLoading = true
        CharacterAPI.shared.fetchCharacters { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false

            switch result {
            case .success(let fetchedCharacters):
                self.characters = fetchedCharacters
            case .failure(let error):
                self.errorMessage = "Failed to fetch: \(error.localizedDescription)"
            }
        }
    }
}
