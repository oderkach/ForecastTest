//
//  ForecastServiceImpl.swift
//  App
//
//  Created by Ostap Derkach on 28.03.2024.
//

import Combine
import Global

final class ForecastServiceImpl {
    @Inject private var forecastNetworkService: ForecastNetworkService
    private let itemsSubj = CurrentValueSubject<ForecastItems, Never>([])
    private var bag = Set<AnyCancellable>()
}

extension ForecastServiceImpl: ForecastService {
    var items: AnyPublisher<ForecastItems, Never> {
        itemsSubj.eraseToAnyPublisher()
    }

    func fetchForecast() {
        forecastNetworkService.getForecast()
            // currently just skip error
            .replaceError(with: [])
            .map { items -> [ForecastItem] in
                items.map(ForecastItem.init)
            }
            .sink { [weak self] items in
                self?.itemsSubj.send(items)
            }.store(in: &bag)
    }

    func removeForecastItem(_ item: ForecastItem) {
        guard let index = itemsSubj.value.firstIndex(where: { $0.day == item.day }) else {
            return
        }
        itemsSubj.value.remove(at: index)
    }
}
