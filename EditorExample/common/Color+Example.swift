//
//  Color+Example.swift
//  macOS Application
//
//  Created by Matthew Davidson on 21/1/20.
//  Copyright © 2020 Matt Davidson. All rights reserved.
//

import Foundation
import EditorCore

#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

extension Color {
    
    public static let exampleTextColor = Color(named: "textColor")!
    
    public static let codeBackgroundColor = Color(named: "codeBackground")!
}
