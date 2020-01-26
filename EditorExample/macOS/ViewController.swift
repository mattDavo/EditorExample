//
//  ViewController.swift
//  EditorExample
//
//  Created by Matthew Davidson on 4/12/19.
//  Copyright © 2019 Matt Davidson. All rights reserved.
//

import Cocoa
import EditorCore
import EditorUI

class ViewController: NSViewController {

    @IBOutlet var textView: EditorTextView!
    var editor: Editor!
    var parser: Parser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lines = """
# My Heading
## Heading 2
### Heading 3

@Keywords are dog, Dog, cat and Cat

@{Hello world}

You're allowed strings: "It's raining cats and dogs"
And string interpolation: \"\\(Wow cat dog)\"

Links: [Hello](https://www.google.com)

```Swift
import EditorCore

let grammar = Grammar(scopeName: "source.example")
```

Testing out // comments

This shouldn't be commented

/*
 * TODO: Woo comment block
 */

_Italic_ *Bold* _Italic and *bold*_ *Bold and _italic_*

Emojis are allowed 😊
"""
        
        
        textView.insertionPointColor = .systemBlue
        textView.string = bigText
        textView.selectedTextAttributes.removeValue(forKey: .foregroundColor)
        textView.linkTextAttributes?.removeValue(forKey: .foregroundColor)
//        textView.replace(lineNumberGutter: LineNumberGutter(withTextView: textView))
        
        parser = Parser(grammars: [exampleGrammar, basicSwiftGrammar])
        parser.shouldDebug = false
        editor = Editor(textView: textView, parser: parser, baseGrammar: exampleGrammar, theme: exampleTheme)
        
        editor.subscribe(toToken: "action") { (res) in
            for (str, range) in res {
                print(str, range)
            }
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
