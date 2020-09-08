//
//  CarsRemoteRepository.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

class CarsRemoteRepository {

    var serviceApi:ServiceApi!
       func fetchCars(request:Request.Fetch.CarsRequest , complete :@escaping ([CarModel]) -> Void, failure:@escaping (String?) -> Void) {
           
           if serviceApi == nil {
               serviceApi = ServiceApi()
           }
           serviceApi.getData(url: request.mURL, withMethod: .GET) {  (response, error) in
               guard error == nil else {
                   failure(error?.localizedDescription)
                   return
               }
               
               if let mData = response as? Data {
                   do {
                    let carsModel = try JSONDecoder().decode([CarModel].self, from: mData)
                        complete(carsModel)
                   } catch  {
                       failure(error.localizedDescription)
                   }
               }
           }
       }
}
