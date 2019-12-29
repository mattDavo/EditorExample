//
//  ViewController.swift
//  EditorExample
//
//  Created by Matthew Davidson on 4/12/19.
//  Copyright © 2019 Matt Davidson. All rights reserved.
//

import Cocoa
import EditorUI

class ViewController: NSViewController {

    @IBOutlet var textView: EditorTextView!
    var editor: Editor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lines = """
# My Heading
## Heading 2
### Heading 3

@Keywords are dog, Dog, cat and Cat

You're allowed strings: "It's raining cats and dogs"
And string interpolation: \"\\(Wow cat dog)\"

Links: [Hello](https://www.google.com)

```
setValue(300, type: .absoluteValueType, for: .width)
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
        textView.string = lines
        textView.replace(lineNumberGutter: LineNumberGutter(withTextView: textView))
        
        exampleGrammar.shouldDebug = true
        editor = Editor(textView: textView, grammar: exampleGrammar, theme: exampleTheme)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
