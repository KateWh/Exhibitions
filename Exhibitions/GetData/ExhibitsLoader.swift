//
//  FileExhibitsLoader.swift
//  Exhibitions
//
//  Created by ket on 4/15/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation

class ExhibitsLoader: IExhibitsLoader {
    
    func getExhibitList(complitionHandler: @escaping ([Exhibit]?) -> Void) {
        // Create Exhibit array.
        var exhibit = [Exhibit]()
        
        // Create URL.
        let urlString = "https://goo.gl/t1qKMS"
        guard let url = URL(string: urlString)  else { return }
        
         // Call URLSession.
        URLSession.shared.dataTask(with: url){ (data, respons, error) in
            // Check the presence of data.
            guard let data = data else{
                return complitionHandler(nil)
            }
            // Unwrapper JSON.
            do{
                let exhibitGallery = try JSONDecoder().decode(ExhibitGallery.self, from: data)
                // Fill an array of objects.
                for object in exhibitGallery.list {
                    exhibit.append(Exhibit(atTitle: object.title, atImages: object.images))
                }
                // Return Exhibits array.
                complitionHandler(exhibit)
            } catch {
                complitionHandler(nil)
            }
        }.resume()
    }
    
}
