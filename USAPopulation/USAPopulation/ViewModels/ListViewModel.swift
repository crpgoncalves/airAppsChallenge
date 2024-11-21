//
//  ListViewModel.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import SwiftUI

@MainActor
class ListViewModel: ObservableObject {
    
    enum SearchType: String, CaseIterable {
        case nation = "Nation"
        case state = "State"
    }
    
    @Published var items = [ItemViewModel]()
    @State var selectedOption: ListViewModel.SearchType = .nation

    private var byState = [ItemViewModel]()
    private var byNation = [ItemViewModel]()
    
    var searchBy: SearchType = .nation {
        didSet {
            switch searchBy {
            case .nation:
                items = byNation
            case .state:
                items = byState
            }
        }
    }

    func retreiveData() async {
        do {
            let byNationData = try await WebService.shared.getPopulationByNation()
            let byStateData = try await WebService.shared.getPopulationByState()
            
            byNation = byNationData.map(ItemViewModel.init)
            byState = byStateData.map(ItemViewModel.init)
            
            searchBy = .nation
        } catch {
            print(error)
        }
    }
    
    

}
