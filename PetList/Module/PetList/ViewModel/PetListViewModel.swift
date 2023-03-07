//
//  PetListViewModel.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation

class PetListViewModel {
    private var petList: PetListModel?
    private let loder = ContentLoader()
    
    var numberOfRows: Int {
        return petList?.pets.count ?? 0
    }
    /****
     To get pet data appropriate index item on table view cell
     - Paremeters
     - closureHandler: Bool
     */
    func getPet(_ indexPath: IndexPath) -> Pet? {
        return petList?.pets[indexPath.row]
    }
    /****
     To fetch pets list from local pets_list json file
     */
    func fetch(closureHandler: @escaping() -> Void) {
        Task {
            petList = try loder.loadBundledContent(fromFileNamed: AppGeneral.FileName.petList)
            closureHandler()
        }
    }
    /****
     To fetch working hours configuration from local config json file
     - Paremeters
     - closureHandler: Bool
     */
    func fetchWorkingHours(closureHandler: @escaping(Bool) -> Void) {
        Task {
            let setting: SettingsModel = try loder.loadBundledContent(fromFileNamed: AppGeneral.FileName.config)
            let response = setting.settings.workHours
            DateConfigurator.checkEligibleForWorkingHours(response: response) { status in
                closureHandler(status)
            }
        }
    }
}
