//
//  ItemViewModel.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import Foundation

class ItemViewModel: Identifiable, ObservableObject {
    let population: String
    let year: String
    let location: String
    
    init(_ model: ByStateModel) {
        location = "📍 " + model.state
        population = "📊 " + String(model.population)
        year = "📅 " + String(model.year)
    }
    
    init(_ model: ByNationModel) {
        location = "📍 " + model.nation
        population = "📊 " + String(model.population)
        year = "📅 " + String(model.year)
    }
}
