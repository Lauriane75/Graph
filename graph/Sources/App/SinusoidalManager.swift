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
        self.displayLink.preferredFramesPerSecond = 30
    }

    // MARK: - Get data

//    private var fakeData: [Float] {
//        return (0...Int(100)).map { x -> Float in
//            let value = (sin(Float(x) / 16 * 5) + Float(1)) / Float(2)
//            return value
//        }
//    }
//
//    func getData() -> [Float] {
//        return self.fakeData
//    }

    // MARK: - View actions

    @objc private func animate(display: CADisplayLink) {
        self.i += displayLink.duration * 10
        let newData = (0...Int(100)).map { x -> Float in
            let value = (sin(Float(Float(x) + Float(self.i)) / 16 * 5) + Float(1)) / Float(2)
            return value
        }
        self.delegate?.animate(with: newData)
    }
}
