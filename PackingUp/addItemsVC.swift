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
        
        tfName.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        tfNumber.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        
        myPicker.dataSource = self
        myPicker.delegate = self
    }
    func pickerView(pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int) -> String! {
            
            return getValuefor(row)
            
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