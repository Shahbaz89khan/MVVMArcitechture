//
//  CarModel.swift
//  SixtTest
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import Foundation

class CarModel: Codable {
    let carImageUrl: String
    let color: String
    let fuelLevel: Float
    let fuelType: String
    let group: String
    let modelName, make, modelIdentifier: String
    let name: String
    let series: String
    let transmission: String
    let innerCleanliness: String
    let id: String
    let licensePlate: String
    let latitude: Double
    let longitude: Double
 
    enum CodingKeys: String, CodingKey {
       
        case carImageUrl
        case color
        case fuelLevel
        case fuelType
        case group
        case modelName, make, modelIdentifier
        case name
        case series
        case transmission
        case innerCleanliness
        case id
        case licensePlate
        case latitude
        case longitude

    }
    
    init(carImageUrl: String, color: String, fuelLevel: Float, fuelType: String, group: String, modelName: String, make: String, modelIdentifier: String, name: String, series: String, transmission: String, innerCleanliness: String, id: String, licensePlate: String, latitude: Double, longitude: Double) {
        
        self.carImageUrl = carImageUrl
        self.color = color
        self.fuelLevel = fuelLevel
        self.fuelType = fuelType
        self.group = group
        self.modelName = modelName
        self.make = make
        self.modelIdentifier = modelIdentifier
        self.name = name
        self.series = series
        self.transmission = transmission
        self.innerCleanliness = innerCleanliness
        self.id = id
        self.licensePlate = licensePlate
        self.latitude = latitude
        self.longitude = longitude
       
    }
}
