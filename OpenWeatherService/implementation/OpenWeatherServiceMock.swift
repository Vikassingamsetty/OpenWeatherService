//
//  OpenWeatherMock.swift
//  ozweather
//
//  Created by Xuwei Liang on 19/11/20.
//

import Foundation
import CoreLocation

open class OpenWeatherServiceMock: WeatherServiceProtocol {
    public var apiKey: String = ""
    
    static let shared = OpenWeatherServiceMock()
    let mockLocation = OpenWeatherServiceMockUtil().mockWeatherForecast()
    let validZipCode = "30303"
    
    private init() { }
    
    public func searchBy(query: WeatherSearchRequest, completionHandler: @escaping (Result<WeatherForecast, WeatherServiceError>) -> Void) {
        switch query.type {
        case .city:
            if mockLocation.name == query.city {
                completionHandler(.success(mockLocation))
            } else {
                completionHandler(.failure(WeatherServiceError.invalidParam))
            }
            return
        case .zipCode:
            if validZipCode == query.zip {
                completionHandler(.success(mockLocation))
            } else {
                completionHandler(.failure(WeatherServiceError.invalidParam))
            }
            return
        case .gpsCoord:
            completionHandler(.success((mockLocation)))
            return
        case .unknown:
            completionHandler(.failure(.invalidParamFormat))
            return
        }
    }
}
