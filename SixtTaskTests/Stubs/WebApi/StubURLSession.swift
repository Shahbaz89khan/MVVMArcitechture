//
//  StubURLSession.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import XCTest
import Foundation
 

//MARK: MOCK


class StubURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    private (set) var resumeWasCalled = false
    var cancelWasCalled = false

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    // We override the 'resume' method and simply call our closure
    // instead of actually resuming any task.
    override func resume() {
        resumeWasCalled = true

        closure()
    }
    
    override func cancel() {
        cancelWasCalled = true
    }
}


class StubURLSession: URLSession {
   
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

    var nextData: Data?
    var nextError: Error?
    var nextResponse:URLResponse?
    
    private (set) var lastURL: URL?
    var resumeWasCalled = false
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = url
        let data = nextData
        let response = nextResponse
        let error = nextError
        let task = StubURLSessionDataTask {
            completionHandler(data, response, error)
        }
        resumeWasCalled  = task.resumeWasCalled
        return task
    }
  
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        let data = nextData
        let response = nextResponse
        let error = nextError
        let task = StubURLSessionDataTask {
            completionHandler(data, response, error)
        }
        resumeWasCalled  = task.resumeWasCalled
        return task
        
    }
    
}
