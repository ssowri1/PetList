//
//  ParentViewController.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation
import SwiftUI

class ParentViewController: UIViewController, Alertable {
    
    func navigate(_ pet: Pet) {
        let petDetail = UIHostingController(rootView: PetDetailView(navigationController: self.navigationController,
                                                                    pet: pet))
        self.navigationController?.pushViewController(petDetail, animated: true)
    }
}
