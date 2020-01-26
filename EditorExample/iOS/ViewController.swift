//
//  ViewController.swift
//  iOS Application
//
//  Created by Matthew Davidson on 21/1/20.
//  Copyright © 2020 Matt Davidson. All rights reserved.
//

import UIKit
import EditorCore
import EditorUI

class ViewController: UIViewController {

    var textView: EditorTextView!
    var parser: Parser!
    var editor: Editor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textView = .create(frame: view.frame)
        view.addSubview(textView)
        
        textView.text = bigText
        textView.linkTextAttributes?.removeValue(forKey: .foregroundColor)
        
        parser = Parser(grammars: [exampleGrammar, basicSwiftGrammar])
        parser.shouldDebug = false
        editor = Editor(textView: textView, parser: parser, baseGrammar: exampleGrammar, theme: exampleTheme)
        
        editor.subscribe(toToken: "action") { (res) in
            for (str, range) in res {
                print(str, range)
            }
        }
    }


}

