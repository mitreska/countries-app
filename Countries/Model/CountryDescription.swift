//
//  CountryDescription.swift
//  Countries
//
//  Created by Mikha's Book on 24/08/22.
//

import Foundation

class CountryDescription: Codable, Identifiable {
    var description: String
    
    init(with countryDescription: CountryDescription) {
        self.description = countryDescription.description
    }
    
    enum CodingKeys: String, CodingKey {
        case description = "extract"
    }
}
