//
//  CountryViewModel.swift
//  Countries
//
//  Created by Mikha's Book on 24/08/22.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    @Published var country: Country
    @Published var countryDescription: CountryDescription?
    
    private let apiConnection: APIConnection
    private var task: Cancellable?
    
    init(with country: Country) {
        self.country = country
        self.apiConnection = APIConnection()
        self.task = nil
        self.countryDescription = nil
    }
    
    func getDescription() {
        if let name = country.areaName {
            self.task = apiConnection.getDescription(countryName: name.lowercased())
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        return
                    case .failure(let error):
                        print("ERROR GETDESCRIPTION_CALL: ", error.localizedDescription)
                    }
                }, receiveValue: { [weak self] response in
                    switch response.result {
                    case .success(let res):
                        print("SUCCESS: ", res)
                        self?.countryDescription = res
                    case .failure(let error):
                        print("ERROR RESPONSE: ", error.localizedDescription)
                        self?.countryDescription = CountryDescription(with: "No description found!")
                    }
                })
        }
        
    }
    
    func setImageURL() -> String {
        if let iso3 = self.country.iso3 {
            return "\(apiConnection.getImageURL())\(iso3.lowercased()).png"
        } else {
            print("ERROR SETIMAGEURL_CALL: No iso3 found!")
            return ""
        }
    }
}
