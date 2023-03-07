//
//  PetsTableViewCell.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import UIKit

class PetsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.cornerCurve()
        }
    }

    @IBOutlet weak var name: SPLabel! {
        didSet {
            name.configure(type: .title)
        }
    }

    @IBOutlet weak var icon: UIImageView! {
        didSet {
            icon.cornerCurve(icon.frame.size.height/2)
        }
    }
    
    override var accessibilityElements: [Any]? {
        set {}
        get {
            return [self.icon as Any, self.name as Any]
        }
    }
    
    var data: Pet? {
        didSet {
            if let data = data {
                name.text = data.title
                icon.imageFromURL(data.imageURL, placeHolder: placeHolderIcon)
//                applyAccessibility(data.title)
            }
        }
    }
    
    private func applyAccessibility(_ name: String) {
        self.icon.isAccessibilityElement = true
        self.icon.accessibilityValue = name + AppGeneral.PetList.image
        self.name.isAccessibilityElement = true
        self.name.accessibilityLabel = AppGeneral.PetList.petName
        self.name.accessibilityValue = name
    }
}

