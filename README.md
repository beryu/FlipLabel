# FlipLabel
![Platform](https://cocoapod-badges.herokuapp.com/p/FlipLabel/badge.svg)
![License](https://img.shields.io/cocoapods/l/FlipLabel.svg?style=flat)
![CocoaPods](https://cocoapod-badges.herokuapp.com/v/FlipLabel/badge.svg)

Flip animation for UILabel

![screenshot1](./assets/screenshot1.gif)

## Installation

### CocoaPods

```
pod 'FlipLabel'
```

### Manually

Add the [FlipLabel.swift](https://github.com/beryu/FlipLabel/blob/master/Source/FlipLabel.swift) file to your project.

## Usage

```
@IBOutlet weak var label: FlipLabel!
```

```
label.playFlip("Hello, world!")
```

## Requirements
* Swift4.0
* iOS 8.0
* ARC

If you want to use even iOS7.0, please to import the code directly.

## License
The MIT License (MIT)

Copyright (c) 2017 Ryuta Kibe (beryu@blk.jp)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
