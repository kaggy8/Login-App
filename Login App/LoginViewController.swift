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
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        
        self.present(alert, animated: true)
    }
    
    private func checkLogin() {
        if loginTF.text == "admin" && passwordTF.text == "admin" {
            
        } else {
            showAlertButtonTapped("Неудачная попытка",
                                  "Неверный логин или пароль, попробуйте снова")
        }
    }
}

