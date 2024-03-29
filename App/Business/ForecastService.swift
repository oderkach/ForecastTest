//
//  ForecastService.swift
//  App
//
//

import Combine

protocol ForecastService {
    var items: AnyPublisher<ForecastItems, Never> { get }
    func fetchForecast()
}
