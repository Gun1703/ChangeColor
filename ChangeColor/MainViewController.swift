//
//  MainViewController.swift
//  ChangeColor
//
//  Created by 1234 on 25.02.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func saveSettings(color: UIColor)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.setColor = view.backgroundColor
    }

}


extension MainViewController: SettingsViewControllerDelegate {
    func saveSettings(color: UIColor) {
        self.view.backgroundColor = color
    }
}
