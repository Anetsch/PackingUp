//
//  settingsVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 20.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation
class settingsVC : UIViewController {
    
    var heart = "\u{2665}"
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        print(heart)
        label.text = "Made with \(heart) by:"
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        //##########SideMenu wird im Code gesetzt##########
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Hamburger_4"), style: .Plain, target: self.revealViewController(), action: Selector("revealToggle:"))
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "light_background_2")?.drawInRect(self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
    }
}