//
//  packingListsVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 19.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation

class packingListsVC : UITableViewController, UIAlertViewDelegate {
    
    var packLists : [String] = ["BusinessTrip","Thailand"]
    var newPackList : String = ""
  

    
    override func viewDidLoad() {
    //##########SideMenu wird im Code gesetzt##########
     navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self.revealViewController(), action: Selector("revealToggle:"))
  
  //   self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
   
    
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = packLists[indexPath.row]
        
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packLists.count
    }
    
//##########Neue Packlisten Hinzufügen##########
    
    @IBAction func addList(sender: AnyObject) {
        let alertController = UIAlertController(title: "Neue Packliste", message: "Bitte geben Sie den Namen für die neue Packliste ein", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Abbrechen", style: .Cancel) { (action) in
            print(action)
        }
        alertController.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Hinzufügen", style: .Default) { (action) in
            let listTextField = alertController.textFields![0] as UITextField
            
            let newList = listTextField.text
            
            self.packLists.append(newList!)
            
            let newIndexPath = NSIndexPath(forRow: self.packLists.count-1, inSection: 0)
            
            self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
        addAction.enabled = false
        //##########Erst aktivieren wenn ein Buchstabe eingegeben wurde##########
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Name"
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                addAction.enabled = textField.text != ""
            }
        }
        
        alertController.addAction(addAction)
        
        self.presentViewController(alertController, animated: true) { () -> Void in
            
        }
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let itemTableViewController = storyboard?.instantiateViewControllerWithIdentifier("itemInListVC") as! itemsInListVC
        
        itemTableViewController.currentList = packLists[indexPath.row]
        
        navigationController?.pushViewController(itemTableViewController, animated: true)
        
    }
}