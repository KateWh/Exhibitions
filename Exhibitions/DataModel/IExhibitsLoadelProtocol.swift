//
//  IExhibitsLoadelProtocol.swift
//  Exhibitions
//
//  Created by ket on 4/15/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation

// Protocol provides data received.
protocol IExhibitsLoader {
    func getExhibitList(complitionHandler: @escaping ([Exhibit]?) -> Void)
}
