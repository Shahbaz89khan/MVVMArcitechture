//
//  CarsListViewModelTests.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import XCTest
@testable import SixtTask

class CarsListViewModelTests: XCTestCase {
    
    var sut: CarsListViewModel!
    var stubRepo:StubCarsRemoteRepository!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        stubRepo = StubCarsRemoteRepository()
        sut = CarsListViewModel(repo: stubRepo)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    
    
    func testFetchCars() {
        
        sut.fetchCars(request: Request.Fetch.CarsRequest())
        
        XCTAssertTrue(stubRepo.isRemoteRepoCalled)
    
    }
    
    func testFetchCarsDataShouldReturnError() {
        stubRepo.shouldFailOnFetch = true
        sut.fetchCars(request: Request.Fetch.CarsRequest())

        XCTAssertNotNil(sut.error)
       
    }
    
    func testFetchCarsDataShouldNotReturnError() {
        stubRepo.dataToReturnOnSuccess = StubCarModel.dummyCar()
        sut.reloadTableViewClosure =  { [weak self] (viewModelList) in
        
        }
        sut.fetchCars(request: Request.Fetch.CarsRequest())
        
        XCTAssertNotNil(sut.carViewModels)
       
    }
    
    
    
    


    

}
