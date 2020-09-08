//
//  CarsMapViewController.swift
//  SixtTask
//
//  Created by Shahbaz Khan on 12/5/19.
//  Copyright © 2019 Shahbaz Khan. All rights reserved.
//

import UIKit
import MapKit
class CarsMapViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    var carViewModels: [CarViewModel] = [CarViewModel]() {
           didSet {
               self.addAnnotations()
           }
       }
    
    // MARK:- UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   private func addAnnotations(){
        
        self.mapView.removeAnnotations(self.mapView.annotations)
        for car in carViewModels {
            let annotation = MKPointAnnotation()
            annotation.title = car.name + " " + car.modelName + " " + car.color
            annotation.coordinate = CLLocationCoordinate2D(latitude: car.latitude, longitude: car.longitude)
            self.mapView.addAnnotation(annotation)
        }
        self.mapView.delegate = self
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
    }
    
    
}

extension CarsMapViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if annotation is MKUserLocation
        {
            return nil;
        }else{
            let pinIdentiefier = "PinIdentiefier";
            var pinView: MKAnnotationView?
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdentiefier)
            {
                dequeuedView.annotation = annotation
                pinView = dequeuedView
            }
            else
            {
                pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: pinIdentiefier)
                pinView?.image = UIImage(named: "carMapIcon")

            }

            pinView?.canShowCallout = true
            return pinView;
        }
    }
    
}


class CustomAnnotation: NSObject, MKAnnotation
{
    // 3
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subTitle : String?
    var carIcon : ImageDownloader?

    // 4
    init(coor: CLLocationCoordinate2D)
    {
        coordinate = coor
    }
}
