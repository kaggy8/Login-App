//
//  AboutMeViewController.swift
//  Login App
//
//  Created by Stanislav Demyanov on 15.05.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    // MARK: - IBOtlets
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    // MARK: - Public properties
    var name: String = ""
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeLabel.text = "Привет, \(name). Меня зовут Станислав! Мне 26 лет. Живу в городе Шахты Ростовской области. Не очень творческий человек xD (для меня это задание очень сложное). "
    }
}
