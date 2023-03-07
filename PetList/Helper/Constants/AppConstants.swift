//
//  AppConstants.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation

import UIKit

struct AppGeneral {
    // String
    struct PetList {
        static let title = "Sepia Pets"
        static let thanksAlert = "Thanks for your Patient!"
        static let thanksMessage = "For smooth process please utilies our features on working hours"
        static let photoArt = "photo.artframe"
    }
    
    // Number
    static let numberOfSection = 1
    static let heightOfCell: CGFloat = 80
    
    // Date
    static let pattern = "^[A-Z]-[A-Z]\\s{1}(\\d{1,2}:\\d{2})\\s{1}-\\s{1}(\\d{1,2}:\\d{2})$"
}

enum FontSizes: CGFloat {
    case title = 20
    case header = 18
    case body = 14
    case footer = 10
}

let placeHolderIcon = UIImage(named: AppGeneral.PetList.photoArt)
