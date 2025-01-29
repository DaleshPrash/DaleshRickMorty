//
//  CharacterListView.swift
//  DaleshRickMorty
//
//  Created by DALESH PRASHAR on 1/29/25.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.characters) { character in
                        CharacterRowView(character: character)
                    }
                }
            }
            .navigationTitle("Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}
