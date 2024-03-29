//
//  ForecastItem.swift
//  App
//
//

import Foundation

typealias ForecastItems = [ForecastItem]

struct ForecastItem {
    let day: String
    let description: String
}

extension ForecastItem {
    init(_ model: ForecastItemDTO) {
        self.day = model.day
        self.description = model.description
    }
}
