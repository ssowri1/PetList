//
//  NSObject+extension.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation

extension NSObject {
    public class var onlyClassName: String {
        return String(describing: self).components(separatedBy: ".").last ?? ""
    }
}
