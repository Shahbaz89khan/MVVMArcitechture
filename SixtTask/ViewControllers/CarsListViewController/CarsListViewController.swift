//
//  CarsListViewController.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

class CarsListViewController: UIViewController {
  
    // MARK: - IBOutlets
    @IBOutlet weak var tableView : UITableView!
    var carViewModels: [CarViewModel] = [CarViewModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
        
    // MARK:- UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension CarsListViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carViewModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "CarsTableViewCell") as! CarsTableViewCell
        cell.viewModel = carViewModels[indexPath.row]
        return cell
    }
    
    
}
