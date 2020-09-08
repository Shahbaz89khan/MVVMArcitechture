//
//  UIStoryboard+Utilities.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/6/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    class func viewController(screenName: String, storyboardName: String, bundle: Bundle? = nil) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: screenName)
    }
    
}
