//
//  HopesViewController.swift
//  Login App
//
//  Created by Stanislav Demyanov on 15.05.2022.
//

import UIKit

class HopesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var hopesLabel: UILabel!
    
    // MARK: - Public properties
    var name = ""
    
    // MARK: - life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hopesLabel.text = "Штож \(name). Здесь могло быть что-то интересное, но я сделал просто чтобы передать имя через NavigationController."
    }

}
