//
//  MapLocationViewController.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/30.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit
import MapKit

class MapLocationViewController: UIViewController {
    
    var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 3000
    let latitude = 40.758873
    let longitude = -73.985134

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        centerMapOnLocation(initialLocation)
        
        let annotation = Annotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                                    title: nil, subTitle: nil)
        mapView.addAnnotation(annotation)
    }

    func setupUI() {
        if mapView == nil {
            mapView = MKMapView(frame: view.bounds)
            mapView.delegate = self
            view.addSubview(mapView)
        }
    }
}

// MARK: - Helpers
extension MapLocationViewController {
    
    private func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        // 设置地区
        mapView.setRegion(coordinateRegion, animated: false)
    }
}

// MARK: - MKMapViewDelegate
extension MapLocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: UI.MapViewIdentifiers.sonarAnnotationView)
        
        if annotationView == nil {
            annotationView = AnnotationView(annotation: annotation, reuseIdentifier: UI.MapViewIdentifiers.sonarAnnotationView)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
}
