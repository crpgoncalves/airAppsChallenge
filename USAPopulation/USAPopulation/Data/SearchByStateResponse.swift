//
//  SearchByStateResponse.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import Foundation
/*
 "data": [
   {
     "ID State": "04000US01",
     "State": "Alabama",
     "ID Year": 2022,
     "Year": "2022",
     "Population": 5028092,
     "Slug State": "alabama"
   }
 ]
}
 */

struct SearchByStateResponse: Decodable {
    let data: [ByStateModel]
}

// Not storing 'ID State', 'ID Year' and 'Slug State' once they are redundant fields
struct ByStateModel: Decodable {
    let population: Int
    let state: String
    let year: String
    
    enum CodingKeys: String, CodingKey {
        case population = "Population"
        case state = "State"
        case year = "Year"
    }
}
