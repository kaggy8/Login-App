//
//  LoginViewController.swift
//  Login App
//
//  Created by Stanislav Demyanov on 06.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var forgotLoginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // MARK: - IBActions
    
    @IBAction func loginButtonPressed(_ sender: UIButton!) {
        checkLogin()
    }
    
    @IBAction func forgotLoginPressed() {
        showAlertButtonTapped("Логин", "admin")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlertButtonTapped("Пароль", "admin")
    }
    
    // MARK: - Private methods
    
    private func showAlertButtonTapped(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okActionButton = UIAlertAction(title: "OK",
                                           style: .default,
                                           handler: nil)
        alert.addAction(okActionButton)
        self.present(alert, animated: true)
    }
    
    private func checkLogin() {
        if loginTF.text != "admin" || passwordTF.text != "admin" {
            showAlertButtonTapped("Неудачная попытка",
                                  "Неверный логин или пароль, попробуйте снова")
            passwordTF.text = ""
        }
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            textField.resignFirstResponder()
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            textField.
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        <#code#>
    }
}

