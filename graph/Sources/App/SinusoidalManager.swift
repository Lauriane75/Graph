//
//  SinusoidalManager.swift
//  graph
//
//  Created by Lauriane Haydari on 10/05/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

protocol SinusoidalDelegate {
    func animate(with data: [Float])
}

class SinusoidalManager: NSObject {

    // MARK: - Properties

    static let sinusoidalManager = SinusoidalManager()

    var delegate: SinusoidalDelegate?

    private var displayLink: CADisplayLink!

    private var i: Double = 0

    // MARK: - Initializer

    override init() {
        super.init()
        self.displayLink = CADisplayLink(target: self, selector: #selector(animate))
        self.displayLink.add(to: .main, forMode: .default)
        self.displayLink.preferredFramesPerSecond = 2
    }

    // MARK: - View actions

    @objc private func animate(display: CADisplayLink) {
        self.i += displayLink.duration * 10
        let newData = (0...Int(100)).map { x -> Float in
            let value = Float.random(in: 0...1)
            return value
        }
        self.delegate?.animate(with: newData)
    }
}
