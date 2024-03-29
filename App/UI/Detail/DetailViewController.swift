//
//  DetailViewController.swift
//  App
//
//

import UIKit
import Combine
import GlobalUI

class DetailViewController: UIViewController {

    private var viewModel: DetailViewModel

    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenView = DetailView()
            .environmentObject(viewModel)

        self.addFullScreenView(screenView)
    }
}
