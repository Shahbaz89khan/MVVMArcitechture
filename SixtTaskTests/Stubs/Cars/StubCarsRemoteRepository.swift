//
//  StubCarsRemoteRepository.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.

import Foundation
@testable import SixtTask

 
class StubCarsRemoteRepository: CarsRemoteRepository {

    var shouldFailOnFetch:Bool = false
    var dataToReturnOnSuccess:CarModel?
    var isRemoteRepoCalled = false

    override func fetchCars(request: Request.Fetch.CarsRequest, complete: @escaping ([CarModel]) -> Void, failure: @escaping (String?) -> Void) {
        
        isRemoteRepoCalled = true
        if shouldFailOnFetch {
            failure(NetworkError.other("Test failing").localizedDescription)
        } else {
            if let data = dataToReturnOnSuccess {
                complete([data])
            }
        }
    }
    
    
    
    
    
}
