//
//  DetailViewCoordinator.swift
//  App
//
//

import UIKit

final class DetailViewCoordinator {
    
    weak var navigationController: UINavigationController?
    private weak var viewController: DetailViewController?

    public func start(navigationController: UINavigationController?, item: ForecastItem) {
        let viewModel = DetailViewModel(item: item)
        let viewController = DetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)

        self.navigationController = navigationController
        self.viewController = viewController
    }
}
