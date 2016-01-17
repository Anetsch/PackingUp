//
//  DetailSingleVC.swift
//  PackingUp
//
//  Created by Ronja Netsch on 17.01.16.
//  Copyright © 2016 Andreas Netsch. All rights reserved.
//

import Foundation
class DetailSingleVC : UIViewController{
        let resizingMask = UIViewAutoresizing.FlexibleWidth
    
    @IBOutlet weak var downloadButton: UIButton!

    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var mImageView: UIImageView!
    var currentList = ""
    override func viewDidLoad() {


        title = currentList
        
        switch currentList{
        case "Business Trip" : mImageView.image = UIImage(named: "Business")
                                star4.image = UIImage(named: "starEmpty")
        case "Aktiv Urlaub" : mImageView.image = UIImage(named: "aktivurlaub")
                                star5.image = UIImage(named: "starFilled")
        default : mImageView.image = UIImage(named: "Thailand")
        }
    }

    @IBAction func doDetail(sender: AnyObject) {
        let itemTableViewController = storyboard?.instantiateViewControllerWithIdentifier("itemInListVC") as! itemsInListVC
        
        itemTableViewController.currentList = currentList
        
        navigationController?.pushViewController(itemTableViewController, animated: true)

    }

    @IBAction func doDowload(sender: AnyObject) {
        let alert = UIAlertController(title: "Heruntergeladen", message: "Die Packliste \(currentList) wurde heruntergeladen und steht nun unter Packlisten zur Verfügung.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        downloadButton.enabled = false
    }



}