//
//  ImageDownloader.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class ImageDownloader: UIImageView {
    
    var imageUrlString: String?
    var serviceApi:ServiceApi = ServiceApi.shared
    
   public func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        
        image = nil
      
        serviceApi.getData(url: urlString, withMethod: nil) { [weak self] (data, error) in
            self?.handleResponse(urlString: urlString,data: data, error: error)
            
    }
    
    }
    
    
    func handleResponse(urlString:String,data:Any?, error:NetworkError?) {
        
        if error != nil {
            print(error ?? "")
             DispatchQueue.main.async {
                self.image  = UIImage(named: placeHolder)
          
            }

            return
        }
        
        DispatchQueue.main.async {
            
            if let d = data {
                let imageToCache = UIImage(data: d as! Data)
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                if let imageToCac = imageToCache {
                    imageCache.setObject(imageToCac, forKey: urlString as NSString)
                }
            } else {
                self.image  = UIImage(named: placeHolder)
            }
           
        }

    }

    
}

