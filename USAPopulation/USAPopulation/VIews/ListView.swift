//
//  ContentView.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var listViewModel = ListViewModel()
    @State private var selectedOption: ListViewModel.SearchType = .nation
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("Search Type", selection: $selectedOption) {
                        ForEach(ListViewModel.SearchType.allCases,
                                id: \.self) {
                            Text($0.rawValue)
                        }.onChange(of: selectedOption) {
                            listViewModel.searchBy = selectedOption
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    ForEach(listViewModel.items) {
                        ItemView(itemViewModel: $0)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("USA Population Search")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await listViewModel.retreiveData()
            }
        }
    }
}

#Preview {
    ListView()
}
