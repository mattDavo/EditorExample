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
        MatchRule(name: "action", match: "\\B@[\\w]+(?!\\S)"),
        MatchRule(name: "action", match: "\\B@(\\{)[\\w\\s]+(\\})(?!\\S)", captures: [
            Capture(),
            Capture(name: "action.syntax"),
            Capture(name: "action.syntax")
        ]),
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
            contentName: "string.content.quoted.double",
            patterns: [
                MatchRule(name: "source.test.05.interpolation", match: #"\\\(.*\)"#, captures: [
                    Capture(patterns: [IncludeGrammarPattern(scopeName: "source.test.05")])
                ])
            ]
        ),
        BeginEndRule(name: "comment.line.double-slash", begin: "//", end: "\\n", patterns: [IncludeRulePattern(include: "todo")]),
        BeginEndRule(name: "comment.block", begin: "/\\*", end: "\\*/", patterns: [IncludeRulePattern(include: "todo")]),
        IncludeRulePattern(include: "bold"),
        IncludeRulePattern(include: "italic"),
        IncludeRulePattern(include: "mono"),
        IncludeRulePattern(include: "test"),
        IncludeRulePattern(include: "swift-code-block"),
        IncludeRulePattern(include: "code-block"),
        BeginEndRule(name: "markup.center", begin: "^\\`center$", end: "^\\`$", patterns: [])
    ],
    repository: Repository(patterns: [
        "todo": MatchRule(name: "comment.keyword.todo", match: "TODO"),
        "bold": MatchRule(name: "markup.bold", match: "(\\*).*?(\\*)", captures: [
            Capture(patterns: [
                IncludeRulePattern(include: "italic")
            ]),
            Capture(name: "markup.syntax"),
            Capture(name: "markup.syntax")
        ]),
        "italic": MatchRule(name: "markup.italic", match: "(_).*?(_)", captures: [
            Capture(patterns: [
                IncludeRulePattern(include: "bold")
            ]),
            Capture(name: "markup.syntax"),
            Capture(name: "markup.syntax")
        ]),
        "mono": MatchRule(name: "markup.mono", match: "`[^`]+?`", captures: [
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
        ]),
        "code-block": BeginEndRule(name: "markup.code.block", begin: "^```", end: "^```$", contentName: "markup.code.block.content", patterns: []),
        "swift-code-block": BeginEndRule(name: "markup.code.block", begin: "^```[Ss]wift$", end: "^```$", contentName: "markup.code.block.content", patterns: [IncludeGrammarPattern(scopeName: "source.swift")])
    ])
)


let readMeExampleGrammar = Grammar(
    scopeName: "source.example",
    fileTypes: [],
    patterns: [
        MatchRule(name: "keyword.special.class", match: "\\bclass\\b"),
        MatchRule(name: "keyword.special.let", match: "\\blet\\b"),
        MatchRule(name: "keyword.special.var", match: "\\bvar\\b"),
        BeginEndRule(
            name: "string.quoted.double",
            begin: "\"",
            end: "\"",
            patterns: [
                MatchRule(name: "source.example", match: #"\\\(.*\)"#, captures: [
                    Capture(patterns: [IncludeGrammarPattern(scopeName: "source.example")])
                ])
            ]
        ),
        BeginEndRule(name: "comment.line.double-slash", begin: "//", end: "\\n", patterns: [IncludeRulePattern(include: "todo")]),
        BeginEndRule(name: "comment.block", begin: "/\\*", end: "\\*/", patterns: [IncludeRulePattern(include: "todo")])
    ],
    repository: Repository(patterns: [
        "todo": MatchRule(name: "comment.keyword.todo", match: "TODO")
    ])
)

let basicSwiftGrammar = Grammar(
    scopeName: "source.swift",
    fileTypes: [],
    patterns: [
        MatchRule(name: "keyword.declarations", match: "\\b(associatedtype|class|deinit|enum|extension|fileprivate|func|import|init|inout|internal|let|open|operator|private|protocol|public|rethrows|static|struct|subscript|typealias|var)\\b"),
        MatchRule(name: "keyword.statements", match: "\\b(break|case|continue|default|defer|do|else|fallthrough|for|guard|if|in|repeat|return|switch|where|while)\\b"),
        MatchRule(name: "keyword.expressionsandtypes", match: "\\b(as|Any|catch|false|is|nil|super|self|Self|throw|throws|true|try)\\b"),
        MatchRule(name: "keyword.patterns", match: "\\b_\\b"),
        MatchRule(name: "keyword.pound", match: "\\b#(available|colorLiteral|column|else|elseif|endif|error|file|fileLiteral|function|if|imageLiteral|line|selector|sourceLocation|warning)\\b"),
        MatchRule(name: "keyword.particularcontexts", match: "\\b(associativity|convenience|dynamic|didSet|final|get|infix|indirect|lazy|left|mutating|none|nonmutating|optional|override|postfix|precedence|prefix|Protocol|required|right|set|Type|unowned|weak|willSet)\\b"),
        MatchRule(name: "numeric", match: "-?(?:(?:0b|0o|0x)?\\d+|\\d+\\.\\d+)"),
        MatchRule(name: "bool", match: "(true|false)"),
        MatchRule(name: "string.quoted.double", match: "\\\"(.*?)\\\"", captures: [
            Capture(),
            Capture(patterns: [
                MatchRule(name: "source.swift", match: #"\\\(.*\)"#, captures: [
                    Capture(),
                    Capture(patterns: [IncludeGrammarPattern(scopeName: "source.swift")])
                ])
            ])
        ]),
    ], repository: Repository(patterns: [
        :
    ])
)

