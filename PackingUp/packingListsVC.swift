//
//  packingListsVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 19.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation

class packingListsVC : UITableViewController {
    
  
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
}