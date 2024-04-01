//
//  ForecastNetworkServiceMock.swift
//  App
//
//  Created by Ostap Derkach on 29.03.2024.
//

import Foundation
import Combine

final class ForecastNetworkServiceMock: ForecastNetworkService {
    func getForecast() -> AnyPublisher<[ForecastItemDTO], Error> {
        Future<[ForecastItemDTO], Error> { promise in
            let item1 = ForecastItemDTO(
                day: "1",
                description: "Sunny",
                sunrise: 27420,
                sunset: 63600,
                chanceRain: 0,
                high: 15,
                low: 6,
                type: "sunny"
            )

            let item2 = ForecastItemDTO(
                day: "2",
                description: "Lightning",
                sunrise: 27540,
                sunset: 63540,
                chanceRain: 0.3,
                high: 17,
                low: 10,
                type: "lightning"
            )

            let item3 = ForecastItemDTO(
                day: "3",
                description: "Rain",
                sunrise: 27600,
                sunset: 63420,
                chanceRain: 0.7,
                high: 18,
                low: 9,
                type: "rain"
            )

            promise(.success([item1, item2, item3]))
        }.eraseToAnyPublisher()
    }
}
