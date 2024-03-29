//
//  ForecastItem.swift
//  App
//
//

import Foundation

typealias ForecastItems = [ForecastItem]

struct ForecastItem {
    enum Condition: String {
        case sunny
        case lightning
        case rain
        case overcast
        case windy
        case showers
        case unknown
    }

    let day: String
    let description: String
    let sunrise: Int
    let sunset: Int
    let high: Int
    let low: Int
    let chanceRain: Double
    let condition: Condition
}

extension ForecastItem {
    var sunriseFormatted: String {
        Formatters.format(seconds: sunrise, style: .positional) ?? ""
    }

    var sunsetFormatted: String {
        Formatters.format(seconds: sunset, style: .positional) ?? ""
    }

    var highFormatted: String {
        "H:\(high)°"
    }

    var lowFormatted: String {
        "L:\(low)°"
    }

    var chanceRainFormatted: String? {
        Formatters.format(percentage: chanceRain)
    }

    var conditionImage: ImageResource? {
        switch condition {
        case .sunny: .sunny
        case .lightning: .lightning
        case .rain: .rain
        case .overcast: .overcast
        case .windy: .windy
        case .showers: .showers
        case .unknown: nil
        }
    }
}

extension ForecastItem {
    init(_ model: ForecastItemDTO) {
        self.day = model.day
        self.description = model.description
        self.sunrise = model.sunrise
        self.sunset = model.sunset
        self.high = model.high
        self.low = model.low
        self.chanceRain = model.chanceRain
        self.condition = Condition(rawValue: model.type) ?? .unknown
    }
}
