//
//  CarsListViewModel.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

protocol CarsListViewModelDelegate: class {
    func showLoader(show: Bool)
    func showError(error: String)
}

class CarsListViewModel : NSObject {
    
    var delegate: CarsListViewModelDelegate?
    
    var screenTitle: String {
        return "Most Popular"
    }
    
    var mapImage: UIImage {
        return UIImage(named: "mapIcon")!.withRenderingMode(.alwaysTemplate)
    }
    
    var listImage: UIImage {
        return UIImage(named: "listIcon")!.withRenderingMode(.alwaysTemplate)
    }
    
    var carViewModels: [CarViewModel] = [CarViewModel]() {
        didSet {
            self.reloadTableViewClosure?(carViewModels)
        }
    }
    
    private var repo:CarsRemoteRepository = CarsRemoteRepository()

    var error:String = String() {
        didSet {
            delegate?.showError(error: error)
        }
    }
    var reloadTableViewClosure: (([CarViewModel])->())?
    
    
   // Mark: - Intializater
    
    init(repo:CarsRemoteRepository = CarsRemoteRepository()) {
        super.init()
        self.repo = repo
    }
    
    
    // MARK: - Network Call
    
    func fetchCars(request:Request.Fetch.CarsRequest) {
        delegate?.showLoader(show: true)
         repo.fetchCars(request: request, complete: {[weak self] (carsModelList) in
            self!.delegate?.showLoader(show: false)
             let carsModelList = carsModelList
            self?.convertCarsModelListToCarsViewModelList(carModelList: carsModelList)
        }) { (error) in
            self.delegate?.showLoader(show: false)
            self.error = error ?? ""
        }
    }
    
    
    // MARK: - Private methods
    
    
   private func convertCarsModelListToCarsViewModelList(carModelList : [CarModel]) {
        var processedViewModelArray = [CarViewModel]()
        
        for item in carModelList {
      
            let viewModel = CarViewModel(name: item.name, modelName: item.modelName, color: item.color, licensePlate: item.licensePlate, carImageURLString: item.carImageUrl,latitude: item.latitude, longitude: item.longitude)
            processedViewModelArray.append(viewModel)
        }
        
        
        self.carViewModels = processedViewModelArray
    }
}
