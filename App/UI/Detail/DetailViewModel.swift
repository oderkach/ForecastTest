//
//  DetailViewModel.swift
//  App
//
//

import Foundation

final class DetailViewModel: ObservableObject {
    @Published public var item: ForecastItem

    init(item: ForecastItem) {
        self.item = item
    }
}
