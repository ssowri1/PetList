//
//  UITableview+extension.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation
import UIKit

public typealias nibName = String
public extension UITableView {
    func registerCell(name: nibName, bundle: Bundle?) {
        let nib = UINib(nibName: name, bundle: bundle)
        register(nib, forCellReuseIdentifier: name)
    }
}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
        return cell
    }
}
