//
//  PreferencesWindowControl.swift
//  f.low
//
//  Created by Erin Havens on 2/21/16.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import Cocoa


class Preferences {
    static private var minVolume: Float32 = 0.2
    static private var maxVolume: Float32 = 1.0

    static func getMinVolume() -> Float32 {
        return minVolume
    }
    
    static func getMaxVolume() -> Float32 {
        return maxVolume
    }

    static func setMinVolume(val: Float32) {
        minVolume = val
    }
    
    static func setMaxVolume(val: Float32) {
        maxVolume = val
    }
}

class PreferencesWindowController: NSWindowController {
    @IBOutlet weak var preferencesWindow: NSWindow!
    @IBOutlet weak var minSlider: NSSlider!
    @IBOutlet weak var maxSlider: NSSlider!

    convenience init() {
        self.init(windowNibName: "PreferencesWindow")
    }

    override func windowDidLoad() {
        super.windowDidLoad()
    
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activateIgnoringOtherApps(true)
        self.window?.releasedWhenClosed = false
    }

    @IBAction func minVolumeChanged(sender: NSSlider) {
        Preferences.setMinVolume(Float32(sender.doubleValue / 100))
    }
    @IBAction func maxVolumeChanged(sender: NSSlider) {
        Preferences.setMaxVolume(Float32(sender.doubleValue / 100))
    }
}
