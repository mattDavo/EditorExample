//
//  ExampleGrammar.swift
//  macOS Application
//
//  Created by Matthew Davidson on 18/12/19.
//  Copyright © 2019 Matt Davidson. All rights reserved.
//

import Foundation
import EditorCore

let exampleGrammar = Grammar(
    scopeName: "source.test.05",
    fileTypes: [],
    patterns: [
        MatchRule(name: "keyword.special.cat", match: "\\b[Cc]at\\b"),
        MatchRule(name: "keyword.special.dog", match: "\\b[Dd]og\\b"),
        MatchRule(name: "action", match: "@[^\\s]+"),
        MatchRule(name: "markdown.link", match: "\\[(.*)\\]\\((.*)\\)", captures: [
            Capture(),
            Capture(name: "markdown.link.name"),
            Capture(name: "markdown.link.link")
        ]),
        MatchRule(name: "", match: "\\|(.*)\\|", captures: [
            Capture(),
            Capture(name: "hidden")
        ]),
        MatchRule(name: "markup.heading.1", match: "^#( .*|)$"),
        MatchRule(name: "markup.heading.2", match: "^##( .*|)$"),
        MatchRule(name: "markup.heading.3", match: "^###( .*|)$"),
        BeginEndRule(
            name: "string.quoted.double",
            begin: "\"",
            end: "\"",
            patterns: [
                MatchRule(name: "source.test.03", match: #"\\\(.*\)"#, captures: [
                    Capture(patterns: [IncludeGrammarPattern()])
                ])
            ]
        ),
        BeginEndRule(name: "comment.line.double-slash", begin: "//", end: "\\n", patterns: [IncludeRulePattern(include: "todo")]),
        BeginEndRule(name: "comment.block", begin: "/\\*", end: "\\*/", patterns: [IncludeRulePattern(include: "todo")]),
        IncludeRulePattern(include: "bold"),
        IncludeRulePattern(include: "italic"),
        IncludeRulePattern(include: "mono"),
        IncludeRulePattern(include: "test"),
        BeginEndRule(name: "markup.center", begin: "^\\`center$", end: "^\\`$", patterns: [])
    ],
    repository: Repository(patterns: [
        "todo": MatchRule(name: "comment.keyword.todo", match: "TODO"),
        "bold": MatchRule(name: "markup.bold", match: "\\*.*?\\*", captures: [
            Capture(patterns: [
                IncludeRulePattern(include: "italic")
            ])
        ]),
        "italic": MatchRule(name: "markup.italic", match: "_.*?_", captures: [
            Capture(patterns: [
                IncludeRulePattern(include: "bold")
            ])
        ]),
        "mono": MatchRule(name: "markup.mono", match: "`.*?`", captures: [
            Capture(patterns: [
                IncludeRulePattern(include: "bold"),
                IncludeRulePattern(include: "italic")
            ])
        ]),
        "test": MatchRule(name: "test", match: "\\+((Hello) (world))\\+", captures: [
            Capture(),
            Capture(name: "Hello world"),
            Capture(name: "Hello"),
            Capture(name: "world")
        ])
    ])
)
