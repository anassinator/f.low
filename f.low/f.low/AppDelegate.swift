//
//  AppDelegate.swift
//  f.low
//
//  Created by Owen Li on 2016-02-20.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private let fc = FlowController()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        fc.start()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        fc.stop()
    }
}
