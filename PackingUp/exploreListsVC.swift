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
    @IBOutlet weak var zurück: UIButton!
    // Whole map
    let namerica = MGLPointAnnotation()
    let samerica = MGLPointAnnotation()
    let africa = MGLPointAnnotation()
    let europe = MGLPointAnnotation()
    let asia = MGLPointAnnotation()
    let australia = MGLPointAnnotation()
    // Specific Regions
    var namericaArray = [MGLPointAnnotation]()
    let namerica1 = MGLPointAnnotation()
    let namerica2 = MGLPointAnnotation()
    let namerica3 = MGLPointAnnotation()
    let namerica4 = MGLPointAnnotation()
    let namerica5 = MGLPointAnnotation()
    
    var samericaArray = [MGLPointAnnotation]()
    let samerica1 = MGLPointAnnotation()
    let samerica2 = MGLPointAnnotation()
    let samerica3 = MGLPointAnnotation()
    let samerica4 = MGLPointAnnotation()
    let samerica5 = MGLPointAnnotation()
    
    var africaArray = [MGLPointAnnotation]()
    let africa1 = MGLPointAnnotation()
    let africa2 = MGLPointAnnotation()
    let africa3 = MGLPointAnnotation()
    let africa4 = MGLPointAnnotation()
    let africa5 = MGLPointAnnotation()
    
    var europeArray = [MGLPointAnnotation]()
    let europe1 = MGLPointAnnotation()
    let europe2 = MGLPointAnnotation()
    let europe3 = MGLPointAnnotation()
    let europe4 = MGLPointAnnotation()
    let europe5 = MGLPointAnnotation()
    
    var asiaArray = [MGLPointAnnotation]()
    let asia1 = MGLPointAnnotation()
    let asia2 = MGLPointAnnotation()
    let asia3 = MGLPointAnnotation()
    let asia4 = MGLPointAnnotation()
    let asia5 = MGLPointAnnotation()
    
    var australiaArray = [MGLPointAnnotation]()
    let australia1 = MGLPointAnnotation()
    let australia2 = MGLPointAnnotation()
    let australia3 = MGLPointAnnotation()
    let australia4 = MGLPointAnnotation()
    let australia5 = MGLPointAnnotation()
    
    var map = MGLCoordinateBounds()
    
    var continent = [MGLPointAnnotation]()
    
    
    var removedAnnotation = String()
    
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
        mapView.scrollEnabled = true
        mapView.delegate = self
        
        
        self.Container.addSubview(mapView)
        
        makeAnnotations()
        continent = [namerica,samerica,africa,europe,asia,australia]
        namericaArray = [namerica1,namerica2,namerica3]
        samericaArray = [samerica1,samerica2,samerica3]
        africaArray = [africa1,africa2,africa3]
        europeArray = [europe1,europe2,europe3]
        asiaArray = [asia1,asia2,asia3]
        australiaArray = [australia1,australia2,australia3]
        
        
        //test
        makeRegions()

        zurück.hidden = true
    }
    
    @IBAction func doZurück(sender: AnyObject) {
        mapView.addAnnotations(continent)
        mapView.removeAnnotations(namericaArray)
        mapView.removeAnnotations(samericaArray)
        mapView.removeAnnotations(africaArray)
        mapView.removeAnnotations(europeArray)
        mapView.removeAnnotations(asiaArray)
        mapView.removeAnnotations(australiaArray)
        mapView.scrollEnabled = true
        let left = CLLocationCoordinate2D(latitude: -75.708634, longitude: -15.097656)
        let right = CLLocationCoordinate2D(latitude: 84.322415, longitude: 146.621094)
        map = MGLCoordinateBounds(sw: left, ne: right)
        mapView.setVisibleCoordinateBounds(map, animated: true)
        zurück.hidden = true
       
        
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
    
//    func mapView(mapView: MGLMapView, regionDidChangeAnimated animated: Bool) {
//        var zoom = mapView.zoomLevel
//        print(zoom)
//    }
    
    // wenn anotation angetippt wird
    func mapView(mapView: MGLMapView, didSelectAnnotation annotation: MGLAnnotation) {
        annotation.title
    }
    
    //wenn anotation text angetippt wird
    func mapView(mapView: MGLMapView, tapOnCalloutForAnnotation annotation: MGLAnnotation) {
        zoomlocation(annotation)
        mapView.addAnnotations(namericaArray)
        mapView.addAnnotations(samericaArray)
        mapView.addAnnotations(africaArray)
        mapView.addAnnotations(europeArray)
        mapView.addAnnotations(asiaArray)
        mapView.addAnnotations(australiaArray)
       mapView.removeAnnotations(continent)
        mapView.setVisibleCoordinateBounds(map, animated: true)
        
    }
    
    
    
    func makeAnnotations(){
        // Set the delegate property of our map view to self after instantiating it.

        
        // Declare the annotation `point` and set its coordinates, title, and subtitle
        // North America Locations
        namerica.coordinate = CLLocationCoordinate2D(latitude: 39.117969, longitude: -103.867188)
        namerica.title = "Nord-Amerika"
        namerica.subtitle = "Hier klicken für Nord-Amerika"
        mapView.addAnnotation(namerica)
        
        
        
        // South America Locations
        samerica.coordinate = CLLocationCoordinate2D(latitude: -14.917383, longitude: -55.351563)
        samerica.title = "Süd-Amerika"
        samerica.subtitle = "Hier klicken für Süd-Amerika"
        mapView.addAnnotation(samerica)
        
        // Africa Locations
        africa.coordinate = CLLocationCoordinate2D(latitude: 11.550874, longitude: 23.398438)
        africa.title = "Afrika"
        africa.subtitle = "Hier klicken für Afrika"
        mapView.addAnnotation(africa)
        
        // Europe Locations
        europe.coordinate = CLLocationCoordinate2D(latitude: 51.853298, longitude: 17.773438)
        europe.title = "Europa"
        europe.subtitle = "Hier klicken für Europa"
        mapView.addAnnotation(europe)
        
        //
        asia.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
        asia.title = "Asien"
        asia.subtitle = "Hier klicken für Asien"
        mapView.addAnnotation(asia)
        
        
        australia.coordinate = CLLocationCoordinate2D(latitude: -24.820828, longitude: 134.140625)
        australia.title = "Australien"
        australia.subtitle = "Hier klicken für Australien"
        mapView.addAnnotation(australia)
    }
    
    func zoomlocation(location: MGLAnnotation){
        zurück.hidden = false
        mapView.scrollEnabled = false
        let mlocation = location.title!!
        switch mlocation {
        case "Nord-Amerika" :
            let left = CLLocationCoordinate2D(latitude: 21.806238, longitude: -135.859375)
            let right = CLLocationCoordinate2D(latitude: 65.009923, longitude: -69.414063)
             map = MGLCoordinateBounds(sw: left, ne: right)
           
        case "Süd-Amerika" :
            let left = CLLocationCoordinate2D(latitude: -55.859398, longitude: -86.289063)
            let right = CLLocationCoordinate2D(latitude: 27.552904, longitude: -31.972656)
             map = MGLCoordinateBounds(sw: left, ne: right)
        case "Afrika" :
            let left = CLLocationCoordinate2D(latitude: -33.808587, longitude: -20.632627)
            let right = CLLocationCoordinate2D(latitude: 37.916256, longitude: 46.515810)
             map = MGLCoordinateBounds(sw: left, ne: right)
        case "Europa" :
            let left = CLLocationCoordinate2D(latitude: 35.521278, longitude: -11.316221)
            let right = CLLocationCoordinate2D(latitude: 63.815352, longitude: 33.507998)
             map = MGLCoordinateBounds(sw: left, ne: right)
        case "Asien" :
            let left = CLLocationCoordinate2D(latitude: -11.105366, longitude: 71.300966)
            let right = CLLocationCoordinate2D(latitude: 53.165055, longitude: 147.941591)
             map = MGLCoordinateBounds(sw: left, ne: right)
        case "Australien" :
            let left = CLLocationCoordinate2D(latitude: -45.036457, longitude: 110.675966)
            let right = CLLocationCoordinate2D(latitude: -10.587445, longitude: 155.148623)
             map = MGLCoordinateBounds(sw: left, ne: right)
        default : print("no Items found")
        }
    }
    
    func makeRegions(){
        // nAmerica
        //nAmerica1
        namerica1.coordinate = CLLocationCoordinate2D(latitude: 38.317099, longitude: -123.015594)
        namerica1.title = "Westküste"
        namerica1.subtitle = "Hier klicken für Westküste"
        //nAmerica2
        namerica2.coordinate = CLLocationCoordinate2D(latitude: 47.317604, longitude: -114.578094)
        namerica2.title = "RockyMountains"
        namerica2.subtitle = "Hier klicken für RockyMountains"
        //nAmerica3
        namerica3.coordinate = CLLocationCoordinate2D(latitude: 40.690223, longitude: -73.994598)
        namerica3.title = "NewYork"
        namerica3.subtitle = "Hier klicken für NewYork"
//        //nAmerica4
//        namerica4.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        namerica4.title = "Asien"
//        namerica4.subtitle = "Hier klicken für Asien"
//        //nAmerica5
//        namerica5.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        namerica5.title = "Asien"
//        namerica5.subtitle = "Hier klicken für Asien"
        
        // sAmerica
        //sAmerica1
        samerica1.coordinate = CLLocationCoordinate2D(latitude: -3.369205, longitude: -60.547333)
        samerica1.title = "Amazonas"
        samerica1.subtitle = "Hier klicken für Amazonas"
        //sAmerica2
        samerica2.coordinate = CLLocationCoordinate2D(latitude: -9.375625, longitude: -75.300598)
        samerica2.title = "Peru"
        samerica2.subtitle = "Hier klicken für Peru"
        //sAmerica3
        samerica3.coordinate = CLLocationCoordinate2D(latitude: -39.731266, longitude: -64.150848)
        samerica3.title = "Argentinien"
        samerica3.subtitle = "Hier klicken für Argentinien"
//        //sAmerica4
//        samerica4.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        samerica4.title = "Asien"
//        samerica4.subtitle = "Hier klicken für Asien"
//        //sAmerica5
//        samerica5.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        samerica5.title = "Asien"
//        samerica5.subtitle = "Hier klicken für Asien"
        
        // africa
        //africa1
        africa1.coordinate = CLLocationCoordinate2D(latitude: -33.237304, longitude: 21.630402)
        africa1.title = "Südafrika"
        africa1.subtitle = "Hier klicken für Südafrika"
        //africa2
        africa2.coordinate = CLLocationCoordinate2D(latitude: 6.546203, longitude: 39.560089)
        africa2.title = "Äthiopien"
        africa2.subtitle = "Hier klicken für Äthiopien"
        //africa3
        africa3.coordinate = CLLocationCoordinate2D(latitude: 30.832918, longitude: 28.947296)
        africa3.title = "Ägypten"
        africa3.subtitle = "Hier klicken für Ägypten"
//        //africa4
//        africa4.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        africa4.title = "Asien"
//        africa4.subtitle = "Hier klicken für Asien"
//        //africa5
//        africa5.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        africa5.title = "Asien"
//        africa5.subtitle = "Hier klicken für Asien"
        
        // europe
        //europe1
        europe1.coordinate = CLLocationCoordinate2D(latitude: 42.233809, longitude: 12.599640)
        europe1.title = "Italien"
        europe1.subtitle = "Hier klicken für Italien"
        //europe2
        europe2.coordinate = CLLocationCoordinate2D(latitude: 56.708429, longitude: 15.500031)
        europe2.title = "Schweden"
        europe2.subtitle = "Hier klicken für Schweden"
        //europe3
        europe3.coordinate = CLLocationCoordinate2D(latitude: 50.685326, longitude: 7.062531)
        europe3.title = "Deutschland"
        europe3.subtitle = "Hier klicken für Deutschland"
//        //europe4
//        europe4.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        europe4.title = "Asien"
//        europe4.subtitle = "Hier klicken für Asien"
//        //europe5
//        europe5.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        europe5.title = "Asien"
//        europe5.subtitle = "Hier klicken für Asien"
        
        // asia
        //asia1
        asia1.coordinate = CLLocationCoordinate2D(latitude: 23.167134, longitude: 114.025423)
        asia1.title = "China"
        asia1.subtitle = "Hier klicken für China"
        //asia2
        asia2.coordinate = CLLocationCoordinate2D(latitude: 35.966008, longitude: 139.513704)
        asia2.title = "Japan"
        asia2.subtitle = "Hier klicken für Japan"
        //asia3
        asia3.coordinate = CLLocationCoordinate2D(latitude: 8.674984, longitude: 99.435579)
        asia3.title = "Thailand"
        asia3.subtitle = "Hier klicken für Thailand"
//        //asia4
//        asia4.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        asia4.title = "Asien"
//        asia4.subtitle = "Hier klicken für Asien"
//        //asia5
//        asia5.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        asia5.title = "Asien"
//        asia5.subtitle = "Hier klicken für Asien"
        
        // australia
        //australia1
        australia1.coordinate = CLLocationCoordinate2D(latitude: -12.676242, longitude: 130.856478)
        australia1.title = "Darwin"
        australia1.subtitle = "Hier klicken für Darwin"
        //australia2
        australia2.coordinate = CLLocationCoordinate2D(latitude: -27.482441, longitude: 153.004915)
        australia2.title = "Brisbane"
        australia2.subtitle = "Hier klicken für Brisbane"
        //australia3
        australia3.coordinate = CLLocationCoordinate2D(latitude: -37.798712, longitude: 144.953310)
        australia3.title = "Melbourne"
        australia3.subtitle = "Hier klicken für Melbourne"
//        //australia4
//        australia4.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        australia4.title = "Asien"
//        australia4.subtitle = "Hier klicken für Asien"
//        //australia5
//        australia5.coordinate = CLLocationCoordinate2D(latitude: 26.141447, longitude: 102.500000)
//        australia5.title = "Asien"
//        australia5.subtitle = "Hier klicken für Asien"
   
        
    }
  
}