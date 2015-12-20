//
//  loginVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 20.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation
class loginVC: UIViewController {
    
    override func viewDidLoad() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self.revealViewController(), action: Selector("revealToggle:"))
    }
}