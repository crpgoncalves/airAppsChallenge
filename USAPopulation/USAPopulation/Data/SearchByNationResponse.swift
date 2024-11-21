//
//  SearchByNationResponse.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import Foundation

/*
 "data": [
   {
     "ID Nation": "01000US",
     "Nation": "United States",
     "ID Year": 2022,
     "Year": "2022",
     "Population": 331097593,
     "Slug Nation": "united-states"
   }
 ]
}
 */

struct SearchByNationResponse: Decodable {
    let data: [ByNationModel]
}

// Not storing 'ID Year' and 'Slug Nation' once they are redundant fields
struct ByNationModel: Decodable {
    let nation: String
    let population: Int
    let year: String
    
    enum CodingKeys: String, CodingKey {
        case nation = "Nation"
        case population = "Population"
        case year = "Year"
    }
}
