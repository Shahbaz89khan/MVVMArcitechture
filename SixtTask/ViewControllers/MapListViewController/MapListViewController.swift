//
//  MapListViewController.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit

class MapListViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
       
    
    // MARK: - Properties
    
    var rightButtonItem : UIButton?
    var carsListViewController : CarsListViewController?
    var carsMapViewController : CarsMapViewController?
    private var carsListViewModel: CarsListViewModel!
    
    var state : State! {
        didSet {
            if let state = state {
                switch state {
                    
                case .mapView:
                    carsListViewController!.view.isHidden = true
                    carsMapViewController!.view.isHidden = false
                    rightButtonItem?.setImage(self.carsListViewModel.listImage , for: .normal)
                    
                case .listView:
                    carsListViewController!.view.isHidden = false
                    carsMapViewController!.view.isHidden = true
                    rightButtonItem?.setImage(self.carsListViewModel.mapImage , for: .normal)
                    
                }
            }
        }
    }
    
   
    
    // MARK:- UIViewController methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureViewModel()
        self.configureNavBar()
        self.initializeViewControllers()
        
        
    }
    
    deinit {
        
        self.activityIndicatorView = nil
        self.carsMapViewController = nil
        self.carsListViewController = nil
        self.carsListViewModel = nil

    }
    
    // MARK:- Private methods
    
    private func configureNavBar() {
        
        // Right Bar Item
        rightButtonItem = UIButton(type: .custom)
        rightButtonItem?.addTarget(self, action:#selector(handleMapClick), for: .touchUpInside)
        rightButtonItem?.tintColor = UIColor.appDarkColor
        let mapBarButtonItem = UIBarButtonItem(customView: rightButtonItem!)
        self.navigationItem.rightBarButtonItem = mapBarButtonItem
        
    }
    
    @objc private func handleMapClick() {
        
        self.state = (self.state == .mapView ? .listView : .mapView)
    }
    
    private func initializeViewControllers() {
        
        carsListViewController = UIStoryboard.viewController(screenName: "CarsListViewController", storyboardName: "Main") as? CarsListViewController
        self.addToContainerView(asChildViewController: carsListViewController!)
        
        carsMapViewController = UIStoryboard.viewController(screenName: "CarsMapViewController", storyboardName: "Main") as? CarsMapViewController
        self.addToContainerView(asChildViewController: carsMapViewController!)
        
        self.state = .mapView
        
    }
    
    private func addToContainerView(asChildViewController viewController: UIViewController) {
        // Add Child View as Subview
        self.containerView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = self.containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func configureViewModel() {
        self.carsListViewModel = CarsListViewModel()
        self.carsListViewModel.delegate = self
        self.fetchCars()
        
        
        self.carsListViewModel.reloadTableViewClosure =  { [weak self] (obj) in
            
            DispatchQueue.main.async {
                self?.carsListViewController?.carViewModels = obj
                self?.carsMapViewController?.carViewModels = obj
                
            }
        }
        
        
    }
    
    private func fetchCars() {
        self.carsListViewModel.fetchCars(request: Request.Fetch.CarsRequest())
    }
    
    
}


extension MapListViewController {
    
    enum State {
        case mapView
        case listView
    }
}


extension MapListViewController : CarsListViewModelDelegate {
    
    func showLoader(show: Bool) {
        DispatchQueue.main.async {
            self.activityIndicatorView.isHidden = !show
        }
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Retry", style: .default) { (UIAlertAction) in
            self.fetchCars()
        }
        
        alertController.addAction(retryAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
