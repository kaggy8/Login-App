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
    
    // MARK: - Private Properties
    private let user = User.getUsers()
    
    // MARK: - Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? AppViewController {
                welcomeVC.nameUser = user.person.fullName
            } else if let aboutVC = viewController as? AboutMeViewController {
                aboutVC.name = user.person.fullName
            } else if let navigationVC = viewController as? UINavigationController {
                let hopesVC = navigationVC.topViewController as! HopesViewController
                hopesVC.name = user.person.fullName
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton!) {
        if loginTF.text != user.login || passwordTF.text != user.password {
            showAlertButtonTapped(titleAlert: "Неудачная попытка",
                                  message: "Неверный логин или пароль, попробуйте снова!",
                                  titleAction: "ОК")
            passwordTF.text = ""
        }
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
        loginTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Private methods
extension LoginViewController {
    private func showAlertButtonTapped(titleAlert: String, message: String, titleAction: String) {
        let alert = UIAlertController(title: titleAlert,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okActionButton = UIAlertAction(title: titleAction,
                                           style: .default,
                                           handler: nil)
        alert.addAction(okActionButton)
        present(alert, animated: true)
    }
    
    private func tapInLogin() {
        loginButton.sendActions(for: .touchUpInside)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            tapInLogin()
        }
        return true
    }
}

