//
//  TopHalfCalculation.swift
//  Rectangle, Ported from Spectacle
//
//  Created by Ryan Hanson on 6/14/19.
//  Copyright © 2019 Ryan Hanson. All rights reserved.
//

import Foundation

class TopHalfCalculation: WindowCalculation, RepeatedExecutionsInThirdsCalculation {

    override func calculateRect(_ params: RectCalculationParameters) -> RectResult {

        if params.lastAction == nil || !Defaults.subsequentExecutionMode.resizes {
            return calculateFirstRect(params)
        }
        
        return calculateRepeatedRect(params)
    }
    
    func calculateFractionalRect(_ params: RectCalculationParameters, fraction: Float) -> RectResult {
        let visibleFrameOfScreen = params.visibleFrameOfScreen

        var rect = visibleFrameOfScreen
        let originalRect = params.window.rect
        
        rect.size.height = floor(visibleFrameOfScreen.height * CGFloat(fraction))
        rect.size.width = originalRect.size.width
        rect.origin.y = visibleFrameOfScreen.maxY - rect.height
        rect.origin.x = originalRect.minX
        
        return RectResult(rect)
    }
    
}
