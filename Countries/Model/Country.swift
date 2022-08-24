//
//  Country.swift
//  Countries
//
//  Created by Mikha's Book on 23/08/22.
//

import Foundation

class Country: Identifiable, Codable {
    var name: String?
    var iso3: String?
    var areaCode: String?
    var areaName: String?
    
    init() {
        self.name = nil
        self.iso3 = nil
        self.areaCode = nil
        self.areaName = nil
    }
    
    init(with name: String) {
        self.name = name
        self.iso3 = nil
        self.areaCode = nil
        self.areaName = nil
    }
    
    init(with country: Country){
        self.name = country.name
        self.iso3 = country.iso3
        self.areaCode = country.areaCode
        self.areaName = country.areaName
    }
}
