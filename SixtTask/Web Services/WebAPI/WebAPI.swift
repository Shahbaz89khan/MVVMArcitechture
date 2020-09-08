//
//  WebAPI.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import Foundation

typealias onCompletion = (Any?, NetworkError?)->()

public enum URLMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
}


protocol WebAPIHandler {
    func getDataFromServer( url: String, withMethod method: URLMethod?,completion: @escaping onCompletion) -> URLSessionTask?
}
