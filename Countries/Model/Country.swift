//
//  Country.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import Foundation

class Country: Identifiable, Codable {
    var imageURL, iso3, areaCode, areaName: String?
    
    init() {
        self.imageURL = nil
        self.areaName = nil
        self.iso3 = nil
        self.areaCode = nil
        self.areaName = nil
    }
    
    init(with name: String) {
        self.areaName = name
        self.iso3 = nil
        self.areaCode = nil
        self.areaName = nil
        self.imageURL = nil
    }
    
    init(with country: Country){
        self.areaName = country.areaName
        self.iso3 = country.iso3
        self.areaCode = country.areaCode
        self.areaName = country.areaName
        self.imageURL = nil
    }
}
