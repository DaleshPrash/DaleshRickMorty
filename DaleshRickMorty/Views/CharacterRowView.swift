//
//  CharacterRowView.swift
//  DaleshRickMorty
//
//  Created by DALESH PRASHAR on 1/29/25.
//

import SwiftUI

struct CharacterRowView: View {
    let character: Character

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                Text(character.status)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
