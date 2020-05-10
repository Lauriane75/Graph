//
//  DrawerDelegate.swift
//  graph
//
//  Created by Lauriane Haydari on 10/05/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class DrawerDelegate: NSObject, CALayerDelegate {

    // MARK: - Properties

    private var data: [Float] = []

    private var frame: CGRect!

    private var width: CGFloat {
        return frame.width
    }

    private var height: CGFloat {
        return frame.height
    }

    // MARK: - Custom properties

    private let strokeColor = UIColor.white.cgColor
    private let setLineWidth: CGFloat = 2

    func getData(_ data: [Float]) {
        self.data = data
    }

    func layoutSublayers(of layer: CALayer) {
        self.frame = layer.frame
    }

    // MARK: - Draw

    func draw(_ layer: CALayer, in ctx: CGContext) {
        drawSinusoidal(ctx)
    }

    // MARK: - Private Functions

    fileprivate func drawSinusoidal(_ ctx: CGContext) {
        let step = width / CGFloat(data.count - 1)

        let points: [CGPoint] = self.data.enumerated().map { (index, d) in
            let x = CGFloat(index) * step
            let y = CGFloat(self.data[index]) * height
            return CGPoint(x: x, y: y)
        }
        ctx.setStrokeColor(strokeColor)
        ctx.setLineWidth(setLineWidth)
        ctx.addLines(between: points)
        ctx.strokePath()
    }
}
