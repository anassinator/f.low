//
//  AboutWindowController.swift
//  f.low
//
//  Created by Erin Havens on 2/21/16.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import Cocoa

class AboutWindowController: NSWindowController {
    @IBOutlet weak var aboutWindow: NSWindow!
    
    convenience init() {
        self.init(windowNibName: "AboutWindow")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
