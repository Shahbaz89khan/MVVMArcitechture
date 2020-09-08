//
//  CarRemoteRepositoryTests.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import XCTest
@testable import SixtTask

class CarRemoteRepositoryTests: XCTestCase {
    
    var sut: CarsRemoteRepository!
    var stub: StubServiceApi!
 
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
 
        sut = CarsRemoteRepository()
        stub = StubServiceApi()
    
        stub.session = StubURLSession()
        sut?.serviceApi = stub
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
      func testShouldReturnErrorOfMappingCars() {
          DummyReachability.isConnected = true
          let session = stub.session as! StubURLSession

          session.nextData = "".data(using: .utf8)
          let request = Request.Fetch.CarsRequest()
          session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
          sut?.fetchCars(request: Request.Fetch.CarsRequest(), complete: { (car) in
              XCTFail()

          }, failure: { (error) in
              XCTAssertEqual(error, "The data couldn’t be read because it isn’t in the correct format.")

          })
          
      }
}
