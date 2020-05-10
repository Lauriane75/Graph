//
//  ViewController.swift
//  graph
//
//  Created by Lauriane Haydari on 03/05/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SinusoidalDelegate {

    // MARK: - Private Files

    private var sinusoidalView: SinusoidalView
    var sinusoidalManager = SinusoidalManager.sinusoidalManager

    // MARK: - Initializer

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.sinusoidalView = SinusoidalView()
        self.sinusoidalView.translatesAutoresizingMaskIntoConstraints = false
        self.sinusoidalView.backgroundColor = .purple

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(self.sinusoidalView)

        loadSinusoidalView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.sinusoidalView.updateWithValues(sinusoidalManager.getData())
    }

    func animate(with data: [Float]) {
        self.sinusoidalView.updateWithValues(data)
        self.sinusoidalView.caLayer.setNeedsDisplay()
    }

    // MARK: - Private Files

    fileprivate func loadSinusoidalView() {
        
        SinusoidalManager.sinusoidalManager.delegate = self

        NSLayoutConstraint.activate([
            self.sinusoidalView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.sinusoidalView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.sinusoidalView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -50),
            self.sinusoidalView.heightAnchor.constraint(equalTo: self.sinusoidalView.widthAnchor)
        ])
    }
}

