//
//  ContentView.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Tap") {
                Task {
                    try await WebService.shared.getPopulationByNation()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ListView()
}
