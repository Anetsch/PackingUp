//
//  profilVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 20.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation
class profilVC : UIViewController {
    
    @IBOutlet weak var female: UIButton!
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    var imageMaleSelected = UIImage(named: "Männchen_ausgewählt")
    var imageMaleNotSelected = UIImage(named: "Männchen_nicht_ausgewählt")
    var imageFemaleSelected = UIImage(named:"Mädchen_ausgewählt")
    var imageFemaleNotSelected = UIImage(named:"Mädchen_nicht_ausgewählt")
    
    @IBAction func buttonFemale(sender: AnyObject) {
        male.setBackgroundImage(imageMaleNotSelected, forState: UIControlState.Normal)
        female.setBackgroundImage(imageFemaleSelected, forState: UIControlState.Normal)
      //  view.addSubview(female)
    }
  
    @IBAction func buttonMale(sender: AnyObject) {
        
        male.setBackgroundImage(imageMaleSelected, forState: UIControlState.Normal)
        female.setBackgroundImage(imageFemaleNotSelected, forState: UIControlState.Normal)
     //   view.addSubview(male)
     //   view.addSubview(female)
    }
    override func viewDidLoad() {
        //Farbanpassung für die NavigationBar
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        //##########SideMenu wird im Code gesetzt##########
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Hamburger_4"), style: .Plain, target: self.revealViewController(), action: Selector("revealToggle:"))
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "light_background_2")?.drawInRect(self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        female.setBackgroundImage(imageFemaleSelected, forState: UIControlState.Normal)
        
        tfName.backgroundColor = UIColor(red: 113.0/255, green: 145.0/255, blue: 90.0/255, alpha: 0.5)
        tfEmail.backgroundColor = UIColor(red: 113.0/255, green: 145.0/255, blue: 90.0/255, alpha: 0.5)
        tfName.layer.borderColor = (UIColor(red: 93.0/255, green: 122.0/255, blue: 96.0/255, alpha: 1.0)).CGColor
        tfEmail.layer.borderColor = (UIColor(red: 93.0/255, green: 122.0/255, blue: 96.0/255, alpha: 1.0)).CGColor
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}