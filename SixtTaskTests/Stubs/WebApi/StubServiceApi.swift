//
//  StubWebApi.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import XCTest
@testable import SixtTask


class DummyReachability: Reachability {
    static var isConnected = true
    override class func isConnectedToNetwork() -> Bool {
        return isConnected
        
    }
}

class StubServiceApi:ServiceApi  {

    private (set) var lastURL: String?
    var dummyData: Data?
    var dummyResponse:URLResponse?
    var dummyError:Error?
    var isServiceApiCalled = false
    
    override func getDataFromServer(url: String, withMethod method: URLMethod?, completion: @escaping onCompletion) -> URLSessionTask? {
        isServiceApiCalled = true
        guard DummyReachability.isConnectedToNetwork() else {
            completion(nil, NetworkError.noNetwork)
            return nil
        }
        
        let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        
        
        if let urL = URL(string: urlString) {
            var request = URLRequest(url: urL)
            if let method = method {
                request.httpMethod = method.rawValue
            }
            
           
            task = session.dataTask(with: request) { (data, response, error) -> Void in
                ParserURLResponse.parseURLResponse(response: response, data: data, completion: completion,error: error)
            } as? StubURLSessionDataTask
            task?.resume()
            return task
        }
        return nil
    }
}
