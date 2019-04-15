//
//  ExhibitCollectionViewCell.swift
//  Exhibitions
//
//  Created by ket on 4/15/19.
//  Copyright © 2019 ket. All rights reserved.
//

import UIKit

class ExhibitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var exhibitLabel: UILabel!
    @IBOutlet weak var exhibitImageView: UIImageView!
    
    // Func for get and set Exhibit instance data.
    func getAndSetExhibitInstanceData(forLabel text: String, forImage imageString: String) {
        // Set title to label.
        self.exhibitLabel.text = text
        // Transform and set image for ImageView.
        let imageURL = URL(string: imageString)
        if let url = imageURL {
            let data = try? Data(contentsOf: url)
            if let imageData = data {
                let image = UIImage(data: imageData)
                self.exhibitImageView.image = image
            }
        }
    }

    
}
