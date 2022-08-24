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
    private let baseURLCountry = ""
    private let baseURLImage = ""
    private var task: Cancellable? = nil
    
    init(){}
    
    func fetchData() -> DataResponsePublisher<Country> {
        return AF.request(baseURLCountry, method: .get)
            .validate(statusCode: 200..<400)
            .publishDecodable(type: Country.self)
    }
}
