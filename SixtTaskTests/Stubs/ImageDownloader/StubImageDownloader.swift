//
//  StubImageDownloader.swift
//  SixtTaskTests
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.

import UIKit

@testable import SixtTask

class StubImageDownloader: ImageDownloader {
    
    var isLoadImageURLCalled = false
    
    override func loadImageUsingUrlString(urlString: String) {
        isLoadImageURLCalled = true
    }

}
