//
//  loginVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 20.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation
class loginVC: UIViewController {
    
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self.revealViewController(), action: Selector("revealToggle:"))
        navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == false, animated: true)
        
        nameTf.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        passwordTf.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        
        
        
    }
    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden == true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Slide
    }
}