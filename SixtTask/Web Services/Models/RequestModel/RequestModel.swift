//
//  RequestModel.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/05/19.
//  Copyright © 2019 Shah Rukh Malik. All rights reserved.
//

import Foundation

let APIURLPrefix = "https://cdn.sixt.io/"

enum Request {
    enum Fetch
    {
        struct CarsRequest
        {

            var mURL: String {
                let url = String(format: APIURLPrefix + "codingtask/cars")
                return url
            }
        }
    }
}
