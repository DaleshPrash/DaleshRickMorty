//
//  CharacterDetailView.swift
//  DaleshRickMorty
//
//  Created by DALESH PRASHAR on 1/29/25.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } placeholder: {
                ProgressView()
            }

            Text(character.name)
                .font(.largeTitle)
                .padding()

            Text("Status: \(character.status)")
                .font(.title2)

            Text("Species: \(character.species)")
                .font(.title2)
            
            Spacer()
        }
        .padding()
    }
}
