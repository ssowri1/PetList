//
//  AlertManager.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import UIKit

protocol Alertable { }

extension Alertable where Self: UIViewController {
    func showAlert(title: String, message: String, closureHandler: @escaping() -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "Okay", style: .default, handler: { (action) in
            closureHandler()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}
