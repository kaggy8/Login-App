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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotLoginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
   
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AppViewController else {
            return
        }
        
        destination.nameUser = "\(loginTF.text ?? "гость")"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction func loginButtonPressed(_ sender: UIButton!) {
        checkLogin()
    }
    
    @IBAction func forgotLoginPressed() {
        showAlertButtonTapped(titleAlert: "Логин",
                              message: "admin",
                              titleAction: "ОК")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlertButtonTapped(titleAlert: "Пароль",
                              message: "admin",
                              titleAction: "ОК")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? AppViewController else {
            return
        }
        
        loginTF.text = source.login
        passwordTF.text = source.password
    }
    
    // MARK: - Private methods
    
    private func showAlertButtonTapped( titleAlert: String, message: String, titleAction: String) {
        let alert = UIAlertController(title: titleAlert,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okActionButton = UIAlertAction(title: titleAction,
                                           style: .default,
                                           handler: nil)
        alert.addAction(okActionButton)
        self.present(alert, animated: true)
    }
    
    private func checkLogin() {
        if loginTF.text != "admin" || passwordTF.text != "admin" {
            showAlertButtonTapped(titleAlert: "Неудачная попытка",
                                  message: "Попробуйте снова!",
                                  titleAction: "ОК")
            passwordTF.text = ""
        }
    }
    
    private func tapInLogin() {
        self.loginButton.sendActions(for: .touchUpInside)
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            textField.resignFirstResponder()
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            textField.resignFirstResponder()
            self.tapInLogin()
        }
        return true
    }
}

