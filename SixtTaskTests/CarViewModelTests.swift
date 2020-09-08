//
//  CarsViewModelTests.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import XCTest
 
@testable import SixtTask

class CarsViewModelTests: XCTestCase {
    
    var carViewModel: CarViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        carViewModel = CarViewModel(name: "T", modelName: "M", color: "C", licensePlate: "P", carImageURLString: "I",latitude: 0, longitude: 0)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        carViewModel = nil
        super.tearDown()
    }

     
    
    func testCarViewModelInit() {
        carViewModel = CarViewModel(name: "T", modelName: "M", color: "C", licensePlate: "P", carImageURLString: "I",latitude: 0, longitude: 0)
        XCTAssertNotNil(carViewModel)
    }
    
    
}
