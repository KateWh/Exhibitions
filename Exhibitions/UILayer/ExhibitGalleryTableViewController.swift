//
//  ExhibitGalleryTableViewController.swift
//  Exhibitions
//
//  Created by ket on 4/15/19.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit

class ExhibitGalleryTableViewController: UITableViewController {
    
    // Create ExhibitsLoader singleton
    let exhibitsLoader = ExhibitsLoader()
    // Create array of exhibit
    var exhibitGallery = [Exhibit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Data receiving.
        getExhibitsGallery()
    }
    
    // Func for data receive.
    func getExhibitsGallery() {
        exhibitsLoader.getExhibitList { (exhibitGallery) in
            switch exhibitGallery {
            case .none:
                // Error massage.
                self.alertHendler(titleAlert: "Error", massage: "Data not received!", titleAlertAction: "Ok")
            case .some(let exhibits):
                // The received data is saved.
                self.exhibitGallery = exhibits
            }
            // Reload tableview in main thread.
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // Func for alert handling.
    func alertHendler(titleAlert: String, massage: String, titleAlertAction: String){
        let alert = UIAlertController(title: titleAlert, message: massage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: titleAlertAction, style: .default , handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitGallery.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exhibitTableViewCell", for: indexPath) as! ExhibitGalleryTableViewCell
        // Pass exibit data to tableviewCell.
        cell.getExibitData(withExibit: exhibitGallery[indexPath.row])
        return cell
    }
    

}
