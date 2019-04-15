//
//  ExhibitGalleryTableViewCell.swift
//  Exhibitions
//
//  Created by ket on 4/15/19.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit

class ExhibitGalleryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var exhibitCollectionView: UICollectionView!
    // Create Exhibit
    var exhibit: Exhibit? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        //Setup cellectionView flow layout.
        setupFlowLoyout()
        // Delegate collectionView.
        self.exhibitCollectionView.dataSource = self
        self.exhibitCollectionView.delegate = self
    }
   

    // Func for setup collectionView flow layout.
    func setupFlowLoyout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 210, height: 240)
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.minimumInteritemSpacing = 5.0
        self.exhibitCollectionView.collectionViewLayout = flowLayout
    }
    
    // Func for get Exhibit.
    func getExibitData(withExibit exhibit: Exhibit) {
        self.exhibit = exhibit
    }
    

    // MARK: - Collection view data sourse
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exhibit?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exhibitCollectionViewCell", for: indexPath) as! ExhibitCollectionViewCell
        // Save exhibit instance data.
        let exhibitLabel = exhibit?.title ?? ""
        let exhibitImage = exhibit?.images[indexPath.row] ?? ""
        // Pass exhibit instance data to collectionViewCell.
        cell.getAndSetExhibitInstanceData(forLabel: exhibitLabel, forImage: exhibitImage)
        return cell
    }

    
}
