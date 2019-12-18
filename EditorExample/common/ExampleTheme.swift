//
//  ExampleTheme.swift
//  macOS Application
//
//  Created by Matthew Davidson on 18/12/19.
//  Copyright © 2019 Matt Davidson. All rights reserved.
//

import Foundation
import EditorCore
import EditorUI

#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa

public extension NSFont {
    class func monospacedSystemFont(ofSize size: CGFloat) -> NSFont {
        return NSFont(name: "SpaceMono-Regular", size: size)!
    }
}
#endif

let exampleTheme = Theme(name: "basic", settings: [
    ThemeSetting(scope: "comment", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemGreen)
    ]),
    ThemeSetting(scope: "constant", parentScopes: [], attributes: []),
    ThemeSetting(scope: "entity", parentScopes: [], attributes: []),
    ThemeSetting(scope: "invalid", parentScopes: [], attributes: []),
    ThemeSetting(scope: "keyword", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemBlue)
    ]),
    ThemeSetting(scope: "markup", parentScopes: [], attributes: []),
    ThemeSetting(scope: "storage", parentScopes: [], attributes: []),
    ThemeSetting(scope: "string", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemRed)
    ]),
    ThemeSetting(scope: "support", parentScopes: [], attributes: []),
    ThemeSetting(scope: "variable", parentScopes: [], attributes: []),
    ThemeSetting(scope: "source", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .textColor),
        FontThemeAttribute(font: .monospacedSystemFont(ofSize: 18)),
        FirstLineHeadIndentThemeAttribute(value: 48),
        TailIndentThemeAttribute(value: -30),
        HeadIndentThemeAttribute(value: 30)
    ]),
    ThemeSetting(scope: "comment.keyword", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemTeal)
    ]),
    ThemeSetting(scope: "markup.bold", parentScopes: [], attributes: [
        BoldThemeAttribute()
    ]),
    ThemeSetting(scope: "markup.italic", parentScopes: [], attributes: [
        ItalicThemeAttribute()
    ]),
    ThemeSetting(scope: "markup.mono", parentScopes: [], attributes: [
        BackgroundColorThemeAttribute(color: .gray, rounded: true),
    ]),
    ThemeSetting(scope: "action", parentScopes: [], attributes: [
        ActionThemeAttribute(linkId: "test")
    ]),
    ThemeSetting(scope: "hidden", parentScopes: [], attributes: [
        FontThemeAttribute(font: .hiddenFont())
    ]),
    ThemeSetting(scope: "markup.heading.1", parentScopes: [], attributes: [
        FontThemeAttribute(font: .monospacedSystemFont(ofSize: 25)),
        FirstLineHeadIndentThemeAttribute(value: 18)
    ]),
    ThemeSetting(scope: "markup.heading.2", parentScopes: [], attributes: [
        FontThemeAttribute(font: .monospacedSystemFont(ofSize: 22)),
        FirstLineHeadIndentThemeAttribute(value: 8)
    ]),
    ThemeSetting(scope: "markup.heading.3", parentScopes: [], attributes: [
        FontThemeAttribute(font: .monospacedSystemFont(ofSize: 20)),
        FirstLineHeadIndentThemeAttribute(value: 0)
    ]),
    ThemeSetting(scope: "markup.center", parentScopes: [], attributes: [
        BackgroundColorThemeAttribute(color: Color.gray, rounded: true),
        TextAlignmentThemeAttribute(value: .center)
    ])
])
