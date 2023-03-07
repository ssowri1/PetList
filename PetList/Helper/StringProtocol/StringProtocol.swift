//
//  StringProtocol.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation

extension StringProtocol {
    var minutesFromTime: Int {
        let index = firstIndex(of: ":")!
        return Int(self[..<index])! * 60 + Int(self[index...].dropFirst())!
    }
}
