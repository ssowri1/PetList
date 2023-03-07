//
//  ViewController.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import UIKit
import SwiftUI

class PetsViewController: ParentViewController {
    
    @IBOutlet weak var petsTableView: UITableView!
    var viewModel = PetListViewModel()
    
    //MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = AppGeneral.PetList.title
        petsTableView.isHidden = true
        validateWorkingHours()
    }
    /****
     To validate the working hours
     */
    func validateWorkingHours() {
        viewModel.fetchWorkingHours { [weak self] status in
            DispatchQueue.main.async {
                status ? self?.configureTableView() : self?.showPopup()
            }
        }
    }

    func configureTableView() {
        petsTableView.registerCell(name: PetsTableViewCell.onlyClassName, bundle: nil)
        fetchPets()
    }
    /****
     To showcase the popup alert
     */
    func showPopup() {
        self.showAlert(title: AppGeneral.PetList.thanksAlert, message: AppGeneral.PetList.thanksMessage) {
            DispatchQueue.main.async {
                self.validateWorkingHours()
            }
        }
    }
    /****
     To fetch Pets details from server
     */
    func fetchPets() {
        viewModel.fetch() { [weak self] in
            DispatchQueue.main.async {
                self?.petsTableView.reloadData()
                self?.petsTableView.isHidden = false
            }
        }
    }
}

//MARK: Table view Delegates and Datasources
extension PetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AppGeneral.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AppGeneral.heightOfCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PetsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        cell.data = viewModel.getPet(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pet = viewModel.getPet(indexPath) {
            navigate(pet)
        }
    }
}
