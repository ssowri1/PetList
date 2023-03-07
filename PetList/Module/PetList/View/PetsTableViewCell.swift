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
    
    var data: Pet? {
        didSet {
            if let data = data {
                name.text = data.title
                icon.imageFromURL(data.imageURL, placeHolder: placeHolderIcon)
            }
        }
    }
}

