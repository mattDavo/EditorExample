//
//  Font+HiddentFont.swift
//  macOS Application
//
//  Created by Matthew Davidson on 18/12/19.
//  Copyright © 2019 Matt Davidson. All rights reserved.
//

import Foundation
import EditorCore

public extension Font {
    
    class func hiddenFont() -> Font {
        return Font(name: "AdobeBlank", size: 10)!
    }
}
