//
//  profilVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 20.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation
class profilVC : UIViewController {
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}