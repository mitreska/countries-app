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
                case .failure(let error):
                    print("ERROR RESPONSE: ", error.localizedDescription)
                }
            })
    }
}
