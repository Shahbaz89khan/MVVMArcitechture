//
//  ImageLoaderTests.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import XCTest
@testable import SixtTask

class ImageLoaderTests: XCTestCase {
    
    
    var sut:ImageDownloader!
    var stubServiceApi:StubServiceApi!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        sut = ImageDownloader()
        stubServiceApi = StubServiceApi()
        sut.serviceApi = stubServiceApi
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testImageDownloadCalled() {
        sut.loadImageUsingUrlString(urlString: "")
        
        XCTAssertTrue(stubServiceApi.isServiceApiCalled)
        
    }
    
    func testDefaultImageSet() {
        sut.handleResponse(urlString: "", data: nil, error: NetworkError.noNetwork)
        
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(sut.image, UIImage(named: "carMapIcon"))
        } else {
            XCTFail("Delay interrupted")
        }
        
        XCTAssertEqual(sut.image, UIImage(named: "carMapIcon"))
        
    }

    
}
