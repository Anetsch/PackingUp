//
//  DetailTableVC.swift
//  PackingUp
//
//  Created by Andreas Netsch on 17.01.16.
//  Copyright © 2016 Andreas Netsch. All rights reserved.
//

import Foundation
import Mapbox


class DetailTableVC : UITableViewController, MGLMapViewDelegate{
    
    var packLists : [String] = ["Business Trip","Backpacking","Aktiv Urlaub"]
        var mapView: MGLMapView!
    var map = MGLCoordinateBounds()
    let resizingMask = UIViewAutoresizing.FlexibleWidth
    
    @IBOutlet weak var Container: UIView!

    override func viewDidLoad() {
        
        // initialize the map view
        mapView = MGLMapView(frame: Container.bounds, styleURL: MGLStyle.lightStyleURL())
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        mapView.zoomEnabled = false
        mapView.pitchEnabled = false
        mapView.rotateEnabled = false
        mapView.scrollEnabled = false
        mapView.delegate = self
        mapView.setVisibleCoordinateBounds(map, animated: true)
        
        self.Container.addSubview(mapView)
        
        
        //Farbanpassung für die NavigationBar
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.autoresizingMask = resizingMask
        backgroundView.addSubview(self.buildImageView())
        tableView.backgroundView = backgroundView
        
        self.tableView.rowHeight = 60.0
        
        tableView.separatorColor = UIColor.whiteColor()
        tableView.separatorStyle = .SingleLineEtched
        tableView.opaque = false
        
    }
    func buildImageView() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "light_background_1"))
        imageView.frame = view.bounds
        imageView.autoresizingMask = resizingMask
        return imageView
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = packLists[indexPath.row]
        cell.tintColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor(red: 74.0/255, green: 100.0/255, blue: 97.0/255, alpha: 1.0)
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packLists.count
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let itemTableViewController = storyboard?.instantiateViewControllerWithIdentifier("DetailSingleVC") as! DetailSingleVC
        
       itemTableViewController.currentList = packLists[indexPath.row]
        
        navigationController?.pushViewController(itemTableViewController, animated: true)
        
    }

}