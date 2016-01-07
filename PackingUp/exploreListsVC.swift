//
//  exploreListsVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 19.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//
import Mapbox
import Foundation
class exploreListsVC : UIViewController, MGLMapViewDelegate{
    
    var mapView: MGLMapView!

    @IBOutlet weak var Container: UIView!
    
    override func viewDidLoad() {
       
        
        
        //Farbanpassung für die NavigationBar
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        //##########SideMenu wird im Code gesetzt##########
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Hamburger_4"), style: .Plain, target: self.revealViewController(), action: Selector("revealToggle:"))
        self.navigationController?.navigationBar.topItem?.title = "Entdecken"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]


        
        
        // initialize the map view
        mapView = MGLMapView(frame: Container.bounds, styleURL: MGLStyle.lightStyleURL())
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        mapView.zoomEnabled = false
        mapView.pitchEnabled = false
        mapView.rotateEnabled = false
        
        Container.addSubview(mapView)
        makeAnnotations()
        
    }
    
    
    func mapView(mapView: MGLMapView, imageForAnnotation annotation: MGLAnnotation) -> MGLAnnotationImage? {
        var annotationImage = mapView.dequeueReusableAnnotationImageWithIdentifier("green_marker")
        
        if annotationImage == nil {
            let image = UIImage(named: "green_marker")
            annotationImage = MGLAnnotationImage(image: image!, reuseIdentifier: "green_marker")
        }
        
        return annotationImage
    }
    
    
    func mapView(mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    // wenn anotation angetippt wird
    func mapView(mapView: MGLMapView, didSelectAnnotation annotation: MGLAnnotation) {
        annotation.title
        print("Didselect \(annotation.title)")
    }
    //wenn anotation text angetippt wird
    func mapView(mapView: MGLMapView, tapOnCalloutForAnnotation annotation: MGLAnnotation) {
        print("Didselect Annotation text \(annotation.title)")
    }
    
    
    
    func makeAnnotations(){
        // Set the delegate property of our map view to self after instantiating it.
        mapView.delegate = self
        
        // Declare the annotation `point` and set its coordinates, title, and subtitle
        let namerica = MGLPointAnnotation()
        namerica.coordinate = CLLocationCoordinate2D(latitude: 39.117969, longitude: -103.867188)
        namerica.title = "Nord-Amerika"
        namerica.subtitle = "Hier klicken für Nord-Amerika"
        mapView.addAnnotation(namerica)
        
        let samerica = MGLPointAnnotation()
        samerica.coordinate = CLLocationCoordinate2D(latitude: -14.917383, longitude: -55.351563)
        samerica.title = "Süd-Amerika"
        samerica.subtitle = "Hier klicken für Süd-Amerika"
        mapView.addAnnotation(samerica)
        
        let africa = MGLPointAnnotation()
        africa.coordinate = CLLocationCoordinate2D(latitude: 11.550874, longitude: 23.398438)
        africa.title = "Afrika"
        africa.subtitle = "Hier klicken für Afrika"
        mapView.addAnnotation(africa)
        
        let europe = MGLPointAnnotation()
        europe.coordinate = CLLocationCoordinate2D(latitude: 51.853298, longitude: 17.773438)
        europe.title = "Europa"
        europe.subtitle = "Hier klicken für Europa"
        mapView.addAnnotation(europe)
        
        let asia = MGLPointAnnotation()
        asia.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
        asia.title = "Asien"
        asia.subtitle = "Hier klicken für Asien"
        mapView.addAnnotation(asia)
        
        let australia = MGLPointAnnotation()
        australia.coordinate = CLLocationCoordinate2D(latitude: -24.820828, longitude: 134.140625)
        australia.title = "Australien"
        australia.subtitle = "Hier klicken für Australien"
        mapView.addAnnotation(australia)
    }
    
    
}