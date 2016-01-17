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
    
    var currentList = ""
    override func viewDidLoad() {


        title = currentList
    
    }



}