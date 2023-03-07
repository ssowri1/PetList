//
//  PetListModel.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation

// MARK: - PetListModel
struct PetListModel: Codable {
    let pets: [Pet]
}

// MARK: - Pet
struct Pet: Codable {
    let imageURL: String
    let title: String
    let contentURL: String
    let dateAdded: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case title
        case contentURL = "content_url"
        case dateAdded = "date_added"
    }
}

// MARK: - SettingModel
struct SettingsModel: Codable {
    let settings: Settings
}

// MARK: - Settings
struct Settings: Codable {
    let workHours: String
}
