//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Mikha's Book on 24/08/22.
//

import Foundation
import Combine

class CountriesViewModel: ObservableObject {
    private let apiConnection = APIConnection()
    private var task: Cancellable? = nil
    
    @Published var countriesList: [Country] = []
    @Published var filteredCountries: [Country] = []
    @Published var searchQuery = ""
    
    func fetchData() {
        self.task = apiConnection.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    return
                case .failure(let error):
                    print("ERROR FETCHDATA_CALL: ", error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                switch response.result {
                case .success(let res):
                    print("SUCCESS: ", res)
                    self?.countriesList = res.map { Country(with: $0) }
                    self?.filteredCountries = self?.countriesList ?? []
                case .failure(let error):
                    print("ERROR RESPONSE: ", error.localizedDescription)
                }
            })
    }
    
    func setImageURL(with country: Country) -> String {
        if let iso3 = country.iso3 {
            return "\(apiConnection.getImageURL())\(iso3.lowercased()).png"
        } else {
            print("ERROR SETIMAGEURL_CALL: No iso3 found!")
            return ""
        }
    }
    
    func filterCountries() {
        if searchQuery.isEmpty {
            filteredCountries = countriesList
        } else {
            filteredCountries = countriesList.filter({
                $0.areaName!
                    .localizedCaseInsensitiveContains(searchQuery)
            })
        }
    }
}
