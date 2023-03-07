//
//  ContentLoader.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation

struct ContentLoader {
    enum Error: Swift.Error {
        case fileNotFound(name: String)
        case fileDecodingFailed(name: String, Swift.Error)
    }

    func loadBundledContent<T: Codable>(fromFileNamed name: String) throws -> T {
        guard let url = Bundle.main.url(
            forResource: name,
            withExtension: "json"
        ) else {
            throw Error.fileNotFound(name: name)
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw Error.fileDecodingFailed(name: name, error)
        }
    }
}
