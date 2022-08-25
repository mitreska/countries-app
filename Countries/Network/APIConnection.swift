//
//  APIConnection.swift
//  Countries
//
//  Created by Mikha's Book on 24/08/22.
//

import Foundation
import Alamofire
import Combine
import UIKit

final class APIConnection {
    private let baseURLCountry = "https://myatlanticoapi-quality.appdev.p.azurewebsites.net/v7/SignUp/GetAreaCodes"
    private let baseURLInfo = "https://en.wikipedia.org/api/rest_v1/page/summary/"
    private let baseURLImage = "https://www.kestrel.ws/flags/current/lg/"
    private var task: Cancellable? = nil
    
    init(){}
    
    func fetchData() -> DataResponsePublisher<[Country]> {
        return AF.request(baseURLCountry, method: .get)
            .validate(statusCode: 200..<400)
            .publishDecodable(type: [Country].self)
    }
    
    func getDescription(countryName: String) -> DataResponsePublisher<CountryDescription> {
        let url = "\(baseURLInfo)\(countryName)"
        return AF.request(url, method: .get)
            .validate(statusCode: 200..<400)
            .publishDecodable(type: CountryDescription.self)
    }
    
    func getImageURL() -> String {
        return baseURLImage
    }
}
