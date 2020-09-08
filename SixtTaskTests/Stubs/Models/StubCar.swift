//
//  StubCarModel.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.

import Foundation

@testable import SixtTask

 class StubCarModel: CarModel {

    static func dummyCar() -> CarModel  {
        return  CarModel(carImageUrl: "C", color: "C", fuelLevel: 0, fuelType: "F", group: "G", modelName: "M", make: "M", modelIdentifier: "M", name: "N", series: "S", transmission: "T", innerCleanliness: "I", id: "I", licensePlate: "L", latitude: 0, longitude: 0)
    }
}
