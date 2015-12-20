//
//  ViewController.swift
//  PackingUp
//
//  Created by Andreas Netsch on 19.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
    
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

