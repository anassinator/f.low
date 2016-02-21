//
//  PreferencesWindowControl.swift
//  f.low
//
//  Created by Erin Havens on 2/21/16.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController {
    @IBOutlet weak var preferencesWindow: NSWindow!
    @IBOutlet weak var minSlider: NSSlider!
    @IBOutlet weak var maxSlider: NSSlider!

    private var minVolume: Float32 = 0.2
    private var maxVolume: Float32 = 1.0
    
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

    func applicationShouldHandleReopen(sender: NSApplication,
                                       hasVisibleWindows: Bool) -> Bool {
        if hasVisibleWindows {
            print("visible")
            //preferencesWindowController?.showWindow(self)
        } else {
            print("invisible")
            //preferencesWindowController?.makeKeyAndOrderFront(self)
        }
        return true
    }

    @IBAction func minVolumeChanged(sender: NSSlider) {
        minVolume = Float32(sender.doubleValue / 100)
    }
    @IBAction func maxVolumeChanged(sender: NSSlider) {
        maxVolume = Float32(sender.doubleValue / 100)
    }
    
    func getMinVolume() -> Float32 {
        return minVolume
    }

    func getMaxVolume() -> Float32 {
        return maxVolume
    }
}
