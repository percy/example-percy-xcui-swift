//
//  TextEditor.swift
//  Sample iOS
//
//  Created by Pankaj Yadav on 12/04/23.
//  Copyright © 2023 BrowserStack. All rights reserved.
//

import UIKit

class TextEditor: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var DisplayText: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameTextField.delegate = self
    }
    
    
    
    // Mark: UITextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        DisplayText.text = textField.text
        nameTextField.text = ""
    }
    
    

}
