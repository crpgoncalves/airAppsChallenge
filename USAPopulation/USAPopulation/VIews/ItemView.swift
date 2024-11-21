//
//  ItemView.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import SwiftUI

struct ItemView: View {
    
    let itemViewModel: ItemViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(itemViewModel.location)
                .font(.bold(.title3)())
            Text(itemViewModel.population)
            Text(itemViewModel.year)
        }
        .padding()
    }
}

#Preview {
    ItemView(itemViewModel: ItemViewModel(ByNationModel(nation: "USA",
                                                   population: 35000,
                                                   year: "2023")))
}
