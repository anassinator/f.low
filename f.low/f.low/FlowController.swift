//
//  FlowController.swift
//  f.low
//
//  Created by Anass Al-Wohoush on 2016-02-20.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import Cocoa
import Darwin

class FlowController {
    private let vm = VolumeMonitor()

    private func dBToLinear(db: Float32) -> Float32 {
        // Convert dB scale to linear scale.
        // Solving for x: db = 20 * log_10 (x).
        return pow(10, db / 20)
    }
    
    private func mapTo(x: Float32, min: Float32, max: Float32) -> Float32 {
        // Maps x of range 0 to 1 to range min to max.
        return x * (max - min) + min
    }
    
    private func fit(x: Float32) -> Float32 {
        return min(Float32(log(x + 0.6) + 0.6), 1.0)
    }

    func start() {
        vm.start(update)
    }
    
    func stop() {
        vm.stop()
    }
    
    func update(average: Float32, peak: Float32) {
        if Preferences.getDisabled() {
            return
        }

        let originalVolume = dBToLinear(peak)
        let fittedVolume = fit(originalVolume)
        let min = Preferences.getMinVolume()
        let max = Preferences.getMaxVolume()
        let volume = mapTo(fittedVolume, min: min, max: max)
        VolumeController.setVolume(volume)
    }
}
