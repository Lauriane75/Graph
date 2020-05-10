//
//  SinusoidalView.swift
//  graph
//
//  Created by Lauriane Haydari on 10/05/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class SinusoidalView: UIView {

    // MARK: - Properties

    private(set) var caLayer: CALayer
    private var drawerDelegate: DrawerDelegate

    // MARK: - Update

    func updateWithValues(_ data:[Float]) {
        self.drawerDelegate.getData(data)
        self.caLayer.setNeedsDisplay()
    }

    // MARK: - Initializer

    override init(frame: CGRect) {
        self.caLayer = CALayer()
        self.caLayer.contentsScale = UIScreen.main.nativeScale
        self.drawerDelegate = DrawerDelegate()
        self.caLayer.delegate = self.drawerDelegate

        super.init(frame: frame)

        self.layer.addSublayer(self.caLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LayoutSubviews

    override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.sublayers?.forEach {
            $0.frame = self.bounds
        }
    }
}
