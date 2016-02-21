//
//  StatusMenuController.swift
//  f.low
//
//  Created by Anass Al-Wohoush on 2016-02-20.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!

    let statusItem = NSStatusBar
                     .systemStatusBar()
                     .statusItemWithLength(NSVariableStatusItemLength)

    private var preferencesWindowController: PreferencesWindowController!

    @IBAction func openPreferenceWindow(sender: NSMenuItem) {
        self.preferencesWindowController.showWindow(self)
    }

    @IBAction func disableToggled(sender: NSMenuItem) {
        Preferences.setDisabled(!Preferences.getDisabled())
        sender.state = 1 - sender.state
    }

    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }

    override func awakeFromNib() {
        statusItem.title = "f.low"
        statusItem.menu = statusMenu
        self.preferencesWindowController = PreferencesWindowController()
    }
}