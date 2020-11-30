//
//  WeatherServiceProtocol.swift
//  ozweather
//
//  Created by Xuwei Liang on 19/11/20.
//

import Foundation
import CoreLocation

open protocol WeatherServiceProtocol {
    var apiKey: String { get set }
    func searchBy(query: WeatherSearchRequest, completionHandler: @escaping (Result<WeatherForecast, WeatherServiceError>)-> Void)
}
