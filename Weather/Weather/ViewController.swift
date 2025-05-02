//
//  ViewController.swift
//  Weather
//
//  Created by Игорь Наумов on 01.05.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2")
    }


    @IBAction func confirmButton(_ sender: Any) {
        let login = loginField.text!
        let password = passwordField.text!
        
        
        if login == "admin" && password == "123456" {
            mainLabel.text = "авторизация прошла успешно"
        } else {
            
            mainLabel.text = "неуспешная авторизация"
        }
    }
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        bottomConstraint.constant = frame.height
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        bottomConstraint.constant = 0
    }
}

