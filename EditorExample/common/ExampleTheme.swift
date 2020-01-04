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
    ThemeSetting(scope: "string.content", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemOrange)
    ]),
    ThemeSetting(scope: "support", parentScopes: [], attributes: []),
    ThemeSetting(scope: "variable", parentScopes: [], attributes: []),
    ThemeSetting(scope: "source", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .textColor),
        FontThemeAttribute(font: .monospacedSystemFont(ofSize: 18)),
        LigatureThemeAttribute(ligature: 0),
        FirstLineHeadIndentThemeAttribute(value: 48),
        TailIndentThemeAttribute(value: -30),
        HeadIndentThemeAttribute(value: 48)
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
        BackgroundColorThemeAttribute(color: .gray, roundingStyle: .quarter),
    ]),
    ThemeSetting(scope: "action", parentScopes: [], attributes: [
        ActionThemeAttribute(actionId: "test", handler: { str, range  in
            print("string: \(str)")
            print("range: \(range)")
        }),
        UnderlineThemeAttribute(color: .clear),
        BackgroundColorThemeAttribute(color: .systemPurple, roundingStyle: .full)
    ]),
    ThemeSetting(scope: "action.syntax", parentScopes: [], attributes: [],
         inSelectionAttributes: [HiddenThemeAttribute(hidden: false)],
         outSelectionAttributes: [HiddenThemeAttribute()]
    ),
    ThemeSetting(scope: "hidden", parentScopes: [], attributes: [], inSelectionAttributes: [
        HiddenThemeAttribute(hidden: false)
    ], outSelectionAttributes: [
        HiddenThemeAttribute(hidden: true)
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
        BackgroundColorThemeAttribute(color: Color.gray, roundingStyle: .quarter, coloringStyle: .line),
    ]),
    ThemeSetting(scope: "markup.center.content", parentScopes: [], attributes: [
        TextAlignmentThemeAttribute(value: .center)
    ]),
    ThemeSetting(
        scope: "markdown.link",
        parentScopes: [],
        attributes: [],
        inSelectionAttributes: [
            HiddenThemeAttribute(hidden: false)
        ],
        outSelectionAttributes: [
            HiddenThemeAttribute(hidden: true)
        ]
    ),
    ThemeSetting(
        scope: "markdown.link.name",
        parentScopes: [],
        attributes: [
            HiddenThemeAttribute(hidden: false),
            ActionThemeAttribute(actionId: "", handler: { str, range in
                
            })
        ],
        outSelectionAttributes: [
            HiddenThemeAttribute(hidden: false)
        ]
    ),
    ThemeSetting(
        scope: "markdown.link.link",
        parentScopes: [],
        attributes: []
    ),
    ThemeSetting(
        scope: "markup.syntax",
        parentScopes: [],
        attributes: [],
        inSelectionAttributes: [
            HiddenThemeAttribute(hidden: false)
        ],
        outSelectionAttributes: [
            HiddenThemeAttribute(hidden: true)
        ]
    ),
    ThemeSetting(scope: "markup.code.block", parentScopes: [], attributes: [
        BackgroundColorThemeAttribute(color: .unemphasizedSelectedTextBackgroundColor, roundingStyle: .full, coloringStyle: .line)
    ])
])


let readMeExampleTheme = Theme(name: "basic", settings: [
    ThemeSetting(scope: "comment", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemGreen)
    ]),
    ThemeSetting(scope: "keyword", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemBlue)
    ]),
    ThemeSetting(scope: "string", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemRed)
    ]),
    ThemeSetting(scope: "source", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .textColor),
        FontThemeAttribute(font: .monospacedSystemFont(ofSize: 18)),
        TailIndentThemeAttribute(value: -30)
    ]),
    ThemeSetting(scope: "comment.keyword", parentScopes: [], attributes: [
        ColorThemeAttribute(color: .systemTeal)
    ])
])
