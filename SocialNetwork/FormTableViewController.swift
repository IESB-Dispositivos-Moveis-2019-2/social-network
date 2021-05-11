//
//  FormTableViewController.swift
//  SocialNetwork
//
//  Created by Pedro Henrique on 10/05/21.
//

import UIKit

class FormTableViewController: UITableViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var checkPasswordField: UITextField!
    
    
    @IBOutlet var textfields: [UITextField]! {
        didSet {
            textfields.forEach { textfield in
                textfield.delegate = self
            }
        }
    }
    
    
}

extension FormTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //validar alguma coisa
        textField.resignFirstResponder()
        if textField == nameField {
            emailField.becomeFirstResponder()
        }
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        if textField == passwordField {
            checkPasswordField.becomeFirstResponder()
        }
    
        return true
    }
    
}
