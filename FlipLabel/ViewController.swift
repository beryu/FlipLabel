//
//  ViewController.swift
//  FlipLabel
//
//  Created by Ryuta Kibe on 2016/01/21.
//  Copyright (c) 2016 blk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: FlipLabel!
    private weak var messageTimer: NSTimer?
    private var currentMessageIndex = -1
    private var messages = ["Hello, world!", "This is demo.", "Use monospaced fonts."]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.messageTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "switchMessage", userInfo: nil, repeats: true)
    }
    
    @objc private func switchMessage() {
        self.currentMessageIndex = (self.currentMessageIndex + 1) % self.messages.count
        self.label.playFlip(self.messages[self.currentMessageIndex])
    }
}

