//
//  ResponseParser.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import Foundation

protocol ParserServiceResponse {
    static func parseURLResponse(response: URLResponse?, data: Data?, completion: onCompletion,error:Error?)
}
struct Parsing {
    static let message = "Json Parsing Error"
    static let unKnown = "UnKnown Error occur, please try again"
    static let tokenError = "attempting to execute a request with an unauthorized token."
    static let noInternet = "Could not stablish connection to the Internet"
    static let operationCanceled = "this operation has been cancelled."
    static let operationTimeOut = "Operation timmed out."

}



struct ParserURLResponse:ParserServiceResponse {
    
    static func parseURLResponse(response: URLResponse?, data: Data?, completion: onCompletion,error:Error?) {
        if let httpResponse = response as? HTTPURLResponse {
            
            let code = httpResponse.statusCode
            if code == 200 {
                if data != nil {
                   completion(data, nil)
                } else {
                    completion(nil, NetworkError.unknown(Parsing.unKnown))
                }
                
            }
            
            else {
                completion(nil, NetworkError.parsingError(Parsing.unKnown))
            }
        } else {
            completion(nil, NetworkError.other(error?.localizedDescription ?? Parsing.unKnown))
        }
    }
}
