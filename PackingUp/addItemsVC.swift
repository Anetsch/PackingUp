//
//  addItemsVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 06.01.16.
//  Copyright © 2016 Andreas Netsch. All rights reserved.
//

import Foundation
class addItemsVC : UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfNumber: UITextField!
    
    @IBOutlet weak var myPicker: UIPickerView!
    
     let resizingMask = UIViewAutoresizing.FlexibleWidth
    override func viewDidLoad() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "light_background_1")?.drawInRect(self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        tfName.backgroundColor = UIColor(red: 113.0/255, green: 145.0/255, blue: 90.0/255, alpha: 0.5)
        tfNumber.backgroundColor = UIColor(red: 113.0/255, green: 145.0/255, blue: 90.0/255, alpha: 0.5)
        tfName.layer.borderColor = (UIColor(red: 93.0/255, green: 122.0/255, blue: 96.0/255, alpha: 1.0)).CGColor
        tfNumber.layer.borderColor = (UIColor(red: 93.0/255, green: 122.0/255, blue: 96.0/255, alpha: 1.0)).CGColor
        
        myPicker.dataSource = self
        myPicker.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func pickerView(pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int) -> String! {
            
            return getValuefor(row)
            
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let titleData = data[row]
        let mytitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName : UIColor(red: 58.0/255, green: 80.0/255, blue: 94.0/255, alpha: 1.0)])
        return mytitle
    }
    func pickerView(pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int) {
            
            
            print("Selected: \(row) and \(component)")
            
    }
    
    let data = ["Bekleidung", "Elektronik", "Dokumente","Kosmetik",
        "Sport", "Reiseapotheke","Grundausstattung", "Sonstiges"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView,
        numberOfRowsInComponent : Int) -> Int {
            
            return data.count
    }
    
    func getValuefor(aRow : Int) -> String{
        return data[aRow]
    }
   
}