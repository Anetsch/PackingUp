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
    let effect = UIBlurEffect(style: .Light)
    let resizingMask = UIViewAutoresizing.FlexibleWidth
    
    @IBOutlet weak var backGround: UIImageView!
    
    override func viewDidLoad() {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self.revealViewController(), action: Selector("revealToggle:"))
        
    
        navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == false, animated: true)
        
        nameTf.backgroundColor = UIColor(red: 113.0/255, green: 145.0/255, blue: 90.0/255, alpha: 0.5)
        passwordTf.backgroundColor = UIColor(red: 113.0/255, green: 145.0/255, blue: 90.0/255, alpha: 0.5)
        nameTf.layer.borderColor = (UIColor(red: 93.0/255, green: 122.0/255, blue: 96.0/255, alpha: 1.0)).CGColor
        passwordTf.layer.borderColor = (UIColor(red: 93.0/255, green: 122.0/255, blue: 96.0/255, alpha: 1.0)).CGColor
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func prefersStatusBarHidden() -> Bool {
        return navigationController?.navigationBarHidden == true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Slide
    }
}