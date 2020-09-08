//
//  CarsTableViewCell.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/6/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

class CarsTableViewCell: UITableViewCell {

    @IBOutlet weak var carImageView: ImageDownloader!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var viewModel : CarViewModel! {
        didSet {
            
            if let viewModel = viewModel {
                self.titleLabel.text = viewModel.name + " " + viewModel.modelName + " " + viewModel.color
                self.subTitleLabel.text = viewModel.licensePlate
                self.carImageView.loadImageUsingUrlString(urlString: viewModel.carImageURLString)

            }
        }
    }
}
