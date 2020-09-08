//
//  CarViewModel.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

class CarViewModel: NSObject {
    
    let name: String!
    let modelName: String!
    let color: String!
    let licensePlate: String!
    let carImageURLString: String!
    let latitude: Double!
    let longitude: Double!

    init(name: String,
         modelName: String,
         color: String,
         licensePlate: String,
         carImageURLString: String, latitude: Double, longitude: Double) {
        self.name = name
        self.modelName = modelName
        self.color = color
        self.licensePlate = licensePlate
        self.carImageURLString = carImageURLString
        self.latitude = latitude
        self.longitude = longitude
    }

}
