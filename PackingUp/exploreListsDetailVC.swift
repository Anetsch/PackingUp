//
//  exploreListsDetailVC.swift
//  PackingUp
//
//  Created by Andreas Netsch on 15.01.16.
//  Copyright © 2016 Andreas Netsch. All rights reserved.
//

import Foundation

import Mapbox
import Foundation
class exploreListsDetailVC : UIViewController, MGLMapViewDelegate{
    
    var mapView: MGLMapView!

    @IBOutlet weak var Container: UIView!

    var map = MGLCoordinateBounds()

    override func viewDidLoad() {
        
        
        
        //Farbanpassung für die NavigationBar
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        

        
        
        
        
        // initialize the map view
        mapView = MGLMapView(frame: Container.bounds, styleURL: MGLStyle.lightStyleURL())
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        mapView.zoomEnabled = false
        mapView.pitchEnabled = false
        mapView.rotateEnabled = false
        mapView.scrollEnabled = true
        mapView.delegate = self
        
        
        self.Container.addSubview(mapView)

    }


}