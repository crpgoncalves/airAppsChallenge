//
//  APIConstants.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import Foundation

struct APIConstants {
    // Consider remove 'year' if its return to much data
    static let byStateURLSting = "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest"
    static let byNationURLString = "https://datausa.io/api/data?drilldowns=Nation&measures=Population"
}
