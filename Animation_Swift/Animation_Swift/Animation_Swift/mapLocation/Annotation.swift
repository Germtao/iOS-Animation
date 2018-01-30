//
//  Annotation.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/30.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit
import MapKit

struct UI {
    /// color
    struct Color {
        static let green = UIColor(red: 0.00, green: 0.87, blue: 0.71, alpha: 1)
    }
    
    /// identifiers
    struct MapViewIdentifiers {
        static let sonarAnnotationView = "sonarAnnotationView"
    }
}

class Annotation: NSObject, MKAnnotation {

    let coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subTitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subTitle
    }
}
