//
//  PetDetailView.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import SwiftUI

struct PetDetailView: View {
    @State private var showWebView = false
    weak var navigationController: UINavigationController?
    let pet: Pet

    var body: some View {
        let contentUrl = pet.contentURL
        NavigationView {
            if let url = URL(string: contentUrl) {
                WebView(url: url)
            }
        }
        .navigationTitle(pet.title)
    }
}

struct PetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailView(pet: Pet(imageURL: "", title: "", contentURL: "", dateAdded: ""))
    }
}
