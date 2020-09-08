//
//  UIColor+Utilities.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

extension UIColor {

class func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}


class var appLightColor: UIColor {
    
    return UIColor.white
    
}

class var appDarkColor: UIColor {
    
    return UIColor.color(red: 234.0, green: 106.0 , blue: 45.0 , alpha: 1.0)
    
}
}
