//
//  FlowController.swift
//  f.low
//
//  Created by Anass Al-Wohoush on 2016-02-20.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import Cocoa

class FlowController {
    private func dBToLinear(db: Float32) -> Float32 {
        // Convert dB scale to linear scale.
        // Solving for x: db = 20 * log_10 (x).
        return pow(10, db / 20)
    }
    
    private func mapTo(x: Float32, min: Float32, max: Float32) -> Float32 {
        // Maps x of range 0 to 1 to range min to max.
        return x * (max - min) + min
    }
}
