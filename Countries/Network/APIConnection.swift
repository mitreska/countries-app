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
        var encodedName = countryName
        zip(["á","é","â","ã","ú","ó","í","õ","ô","ç"," "], ["%C3%A1","e","a","%C3%A3","%C3%BA","%C3%B3","%C3%AD","%C3%B5","%C3%B4","%C3%A7","%20"]).forEach({
            encodedName = encodedName.replacingOccurrences(of: $0, with: $1, options: .literal)
        })
        
        let url = "\(baseURLInfo)\(encodedName)"
        
        print(url)
        
        return AF.request(url, method: .get)
            .validate(statusCode: 200..<400)
            .publishDecodable(type: CountryDescription.self)
    }
    
    func getImageURL() -> String {
        return baseURLImage
    }
}
