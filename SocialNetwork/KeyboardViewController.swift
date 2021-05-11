//
//  KeyboardViewController.swift
//  SocialNetwork
//
//  Created by Pedro Henrique on 10/05/21.
//

import UIKit

class KeyboardViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField! {
        didSet {
            textfield.delegate = self
        }
    }
    
    @IBOutlet weak var textfieldBottomConstraint: NSLayoutConstraint! {
        didSet {
            initialValue = textfieldBottomConstraint.constant
        }
    }
    
    private var initialValue: CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidAppear(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: view.window)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidDisapper(_:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: view.window)
        
        let tapGesture = UITapGestureRecognizer(target: textfield, action: #selector(textfield.resignFirstResponder))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc private func keyboardDidAppear(_ sender: Notification) {
        if let frame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            textfieldBottomConstraint.constant = initialValue + frame.size.height
        }
    }
    
    @objc private func keyboardDidDisapper(_ sender: Notification) {
        textfieldBottomConstraint.constant = initialValue
    }
    
    
}

extension KeyboardViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    
    
}
