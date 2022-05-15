//
//  AppViewController.swift
//  Login App
//
//  Created by Stanislav Demyanov on 06.04.2022.
//

import UIKit

class AppViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var helloLabel: UILabel!
    
    // MARK: - Public properties
    
    var nameUser = ""
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        
        helloLabel.text = "Привет,  \(nameUser)!"
    }
}
