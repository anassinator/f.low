//
//  PreferencesWindowControl.swift
//  f.low
//
//  Created by Erin Havens on 2/21/16.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController {
    @IBOutlet weak var preferencesWindowControl: NSWindow!
    @IBOutlet weak var minSlider: NSSlider!
    @IBOutlet weak var maxSlider: NSSlider!

    convenience init() {
        self.init(windowNibName: "PreferencesWindow")
    }
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
    }


    @IBAction func changeMin(sender: AnyObject) {
    }

    @IBAction func changeMax(sender: AnyObject) {
    }
    
}
