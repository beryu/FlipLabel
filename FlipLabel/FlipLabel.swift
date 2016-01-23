//
//  FlipLabel.swift
//  FlipLabel
//
//  Created by Ryuta Kibe on 2016/01/21.
//  Copyright (c) 2016 blk. All rights reserved.
//

import UIKit

public enum FlipLabelType: Int {
    case Default
    case Simple
}

public class FlipLabel: UILabel {
    
    // MARK: - Private properties
    
    private var currentFullText = ""
    private var lastFullText = ""
    private var currentMainIndex = 0
    private var currentDummyIndex = 0
    private var animationTextLength: Int = 0
    private var currentTextLength: Int = 0
    private var lastTextLength: Int = 0
    private weak var mainAnimationTimer: NSTimer?
    private weak var dummyAnimationTimer: NSTimer?
    private var dummyLabels = [UILabel]()
    private var randomChars: [String] = ["A" ,"B" ,"C" ,"D" ,"E" ,"F" ,"G" ,"H" ,"I" ,"J" ,"K" ,"L" ,"M" ,"N" ,"O" ,"P" ,"Q" ,"R" ,"S" ,"T" ,"U" ,"V" ,"W" ,"X" ,"Y" ,"Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "@"]
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Public methods
    
    public func playFlip(text: String?, interval: NSTimeInterval = 0.03, type: FlipLabelType = .Default) {
        // Reset
        if let mainAnimationTimer = self.mainAnimationTimer {
            mainAnimationTimer.invalidate()
            self.mainAnimationTimer = nil
        }
        if let dummyAnimationTimer = self.dummyAnimationTimer {
            dummyAnimationTimer.invalidate()
            self.dummyAnimationTimer = nil
        }
        self.clearDummyLabels()
        
        // Save full text
        if let lastText = self.text {
            self.lastFullText = lastText
        } else {
            self.lastFullText = ""
        }
        self.currentFullText = text ?? ""
        self.lastTextLength = (self.lastFullText as NSString).length
        self.currentTextLength = (self.currentFullText as NSString).length
        self.animationTextLength = max(self.currentTextLength, self.lastTextLength)

        if self.currentFullText != "" || self.lastFullText != "" {
            self.currentMainIndex = 0

            if type == .Default {
                self.currentDummyIndex = 0

                // Set dummy labels
                var label = UILabel()
                label.textAlignment = self.textAlignment
                label.frame = self.bounds
                label.font = self.font
                label.textColor = UIColor(red: 0.9, green: 0.0, blue: 0.1, alpha: 1.0)
                self.dummyLabels.append(label)
                self.addSubview(label)
                
                label = UILabel()
                label.textAlignment = self.textAlignment
                label.frame = self.bounds
                label.font = self.font
                label.textColor = UIColor(red: 0.0, green: 0.8, blue: 0.1, alpha: 1.0)
                self.dummyLabels.append(label)
                self.addSubview(label)
                
                label = UILabel()
                label.textAlignment = self.textAlignment
                label.frame = self.bounds
                label.font = self.font
                label.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
                self.dummyLabels.append(label)
                self.addSubview(label)

                // Start dummy animation
                self.dummyAnimationTimer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "onDummyFrame", userInfo: nil, repeats: true)
            }

            self.mainAnimationTimer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: "onMainFrame", userInfo: nil, repeats: true)
        }
    }
    
    @objc private func onMainFrame() {
        if self.currentMainIndex++ < 0 {
            return
        }
        if self.currentMainIndex >= self.currentTextLength {
            if let mainAnimationTimer = self.mainAnimationTimer {
                mainAnimationTimer.invalidate()
                self.mainAnimationTimer = nil
            }
            return
        }
        let text = (self.currentFullText as NSString).substringToIndex(self.currentMainIndex)
        self.text = text
        if self.lastTextLength > self.currentMainIndex + 1 {
            self.text = text + (self.lastFullText as NSString).substringFromIndex(self.currentMainIndex)
        }
    }
    
    @objc private func onDummyFrame() {
        if self.currentDummyIndex++ >= self.animationTextLength + 2 {
            if let dummyAnimationTimer = self.dummyAnimationTimer {
                dummyAnimationTimer.invalidate()
                self.dummyAnimationTimer = nil
                
                self.text = self.currentFullText
                self.clearDummyLabels()
            }
            return
        }
        for dummyLabel in self.dummyLabels {
            var text = ""
            for var i = 0, limit = self.currentDummyIndex + 3 + Int(arc4random_uniform(2)); i < limit && i < self.animationTextLength; i++ {
                if self.currentDummyIndex - 1 <= i {
                    let randomIndex = arc4random_uniform(UInt32(self.randomChars.count))
                    text = text + self.randomChars[Int(randomIndex)]
                } else {
                    text = text + " "
                }
            }
            dummyLabel.text = text
        }
        if self.currentTextLength <= self.currentDummyIndex && self.lastTextLength > self.currentDummyIndex {
            var spaces = ""
            for var j = self.currentTextLength + 1; j < self.currentDummyIndex; j++ {
                spaces = spaces + " "
            }
            self.text = self.currentFullText + spaces + (self.lastFullText as NSString).substringFromIndex(self.currentDummyIndex)
        }
    }
    
    private func clearDummyLabels() {
        for dummyLabel in self.dummyLabels {
            if dummyLabel.superview != nil {
                dummyLabel.removeFromSuperview()
            }
        }
        self.dummyLabels.removeAll()
    }
}
