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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func button1WasTapped(sender: AnyObject) {
        self.label.playFlip("Hello, world!")
    }
    
    @IBAction func button2WasTapped(sender: AnyObject) {
        self.label.playFlip("12345678901234567890")
    }
}

