//
//  PetListTests.swift
//  PetListTests
//
//  Created by Sowrirajan S on 07/03/23.
//

import XCTest
@testable import PetList

final class PetListTests: XCTestCase {
    
    var viewModel = PetListViewModel()
    
    func testnumberOfRows() {
        viewModel.fetch {
            XCTAssertTrue(self.viewModel.numberOfRows == 10)
        }
    }
    
    func testGetPetTrue() {
        let indexpath = IndexPath(row: 0, section: 0)
        viewModel.fetch {
            let pet = self.viewModel.getPet(indexpath)
            XCTAssertTrue(pet?.title == "Cat")
            XCTAssertTrue(pet?.contentURL == "https://en.wikipedia.org/wiki/Cat")
            XCTAssertTrue(pet?.imageURL == "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Cat_poster_1.jpg/1200px-Cat_poster_1.jpg")
            XCTAssertTrue(pet?.dateAdded == "2018-06-02T03:27:38.027Z")
        }
    }
    
    func testGetPetFalse() {
        let indexpath = IndexPath(row: 5, section: 0)
        viewModel.fetch {
            let pet = self.viewModel.getPet(indexpath)
            XCTAssertFalse(pet?.title == "Ferret")
            XCTAssertFalse(pet?.contentURL == "https://en.wikipedia.org/wiki/Ferret")
            XCTAssertFalse(pet?.imageURL == "https://upload.wikimedia.org/wikipedia/commons/3/32/Ferret_2008.png")
            XCTAssertFalse(pet?.dateAdded == "2018-06-23T19:14:04.027Z")
        }
    }
}
