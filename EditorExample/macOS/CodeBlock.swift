//
//  CodeBlock.swift
//  macOS Application
//
//  Created by Matthew Davidson on 29/12/19.
//  Copyright © 2019 Matt Davidson. All rights reserved.
//

import Foundation
import Cocoa

class CodeBlock: NSTextBlock {
    
    let leftIndentPadding: CGFloat
    let rightIndentPadding: CGFloat
    let cornerRadius: CGFloat
    
    init(
        leftIndentPadding: CGFloat = 0,
        rightIndentPadding: CGFloat = 0,
        backgroundColor: NSColor = .textBackgroundColor,
        cornerRadius: CGFloat = 0
    ) {
        self.leftIndentPadding = leftIndentPadding
        self.rightIndentPadding = rightIndentPadding
        self.cornerRadius = cornerRadius
        super.init()
        self.backgroundColor = backgroundColor
        
        commonInit()
    }
    
    override init() {
        self.leftIndentPadding = 0
        self.rightIndentPadding = 0
        self.cornerRadius = 0
        super.init()
        
        backgroundColor = .systemGray
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        self.leftIndentPadding = 0
        self.rightIndentPadding = 0
        self.cornerRadius = 0
        
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        setWidth(5, type: .absoluteValueType, for: .padding)
        setValue(100, type: .percentageValueType, for: .width)
    }
    
    override func drawBackground(withFrame frameRect: NSRect, in controlView: NSView, characterRange charRange: NSRange, layoutManager: NSLayoutManager) {
        let newRect = frameRect
            .insetBy(dx: (leftIndentPadding + rightIndentPadding) / 2, dy: 0)
            .insetBy(dx: cornerRadius, dy: cornerRadius)
            .offsetBy(dx: (leftIndentPadding - rightIndentPadding) / 2, dy: 0)
        
        
        let path = CGPath(roundedRect: newRect, cornerWidth: cornerRadius, cornerHeight: cornerRadius, transform: nil)

        backgroundColor!.set()
        
        let cgContext = NSGraphicsContext.current?.cgContext
        cgContext?.setLineWidth(cornerRadius * 2.0)
        cgContext?.setLineJoin(.round)

        cgContext?.setAllowsAntialiasing(true)
        cgContext?.setShouldAntialias(true)

        cgContext?.addPath(path)
        cgContext?.drawPath(using: .fillStroke)
    }
}
