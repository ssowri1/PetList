//
//  UITableviewcell+extension.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation
import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
