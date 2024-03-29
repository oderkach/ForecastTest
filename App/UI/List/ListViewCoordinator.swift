//
//  ListViewCoordinator.swift
//  App
//
//

import UIKit

class ListViewCoordinator {

    weak var navigationController: UINavigationController?
    private weak var viewController: ListViewController?

    public func start(window: UIWindow) {
        let viewModel = ListViewModel()

        let viewController = ListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController

        viewModel.showDetail = { item in
            DetailViewCoordinator().start(navigationController: navigationController, item: item)
        }

        self.navigationController = navigationController
        self.viewController = viewController
    }
}
