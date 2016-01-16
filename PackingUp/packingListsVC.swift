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
    let resizingMask = UIViewAutoresizing.FlexibleWidth
    
    override func viewDidLoad() {
    //Farbanpassung für die NavigationBar
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0)
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
    //##########SideMenu wird im Code gesetzt##########
     navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Hamburger_4"), style: .Plain, target: self.revealViewController(), action: Selector("revealToggle:"))
        
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.autoresizingMask = resizingMask
        backgroundView.addSubview(self.buildImageView())
        tableView.backgroundView = backgroundView
        
        self.tableView.rowHeight = 60.0
        
        tableView.separatorColor = UIColor.whiteColor()
        tableView.separatorStyle = .SingleLineEtched
        tableView.opaque = false
    
    }
 
    func buildImageView() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "light_background_1"))
        imageView.frame = view.bounds
        imageView.autoresizingMask = resizingMask
        return imageView
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = packLists[indexPath.row]
        cell.tintColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor(red: 74.0/255, green: 100.0/255, blue: 97.0/255, alpha: 1.0)
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packLists.count
    }
    
//##########Neue Packlisten Hinzufügen##########    
    @IBAction func addList(sender: AnyObject) {
        let alertController = UIAlertController(title: "Neue Packliste", message: "Bitte geben Sie den Namen für die neue Packliste ein", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Abbrechen", style: .Cancel) { (action) in
           
        }
        
        let addAction = UIAlertAction(title: "Hinzufügen", style: .Default) { (action) in
            let listTextField = alertController.textFields![0] as UITextField
            listTextField.backgroundColor = UIColor(red: 113.0/255, green: 145.0/255, blue: 90.0/255, alpha: 0.5)
            listTextField.layer.borderColor = (UIColor(red: 93.0/255, green: 122.0/255, blue: 96.0/255, alpha: 1.0)).CGColor
            
            let newList = listTextField.text
            
            self.packLists.append(newList!)
            
            let newIndexPath = NSIndexPath(forRow: self.packLists.count-1, inSection: 0)
            
            self.tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
        addAction.enabled = false
//##########Erst aktivieren wenn ein Buchstabe eingegeben wurde##########
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Name"
            textField.textColor = UIColor(red: 58.0/255, green: 80.0/255, blue: 94.0/255, alpha: 1.0)
            
            textField.keyboardAppearance = .Dark
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                addAction.enabled = textField.text != ""
                
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        alertController.view.backgroundColor = UIColor(red: 58.0/255, green: 80.0/255, blue: 94.0/255, alpha: 1.0)
       alertController.view.tintColor = UIColor(red: 58.0/255, green: 80.0/255, blue: 94.0/255, alpha: 1.0)
        
        alertController.view.layer.cornerRadius = 0.4 * alertController.view.bounds.size.width
        self.presentViewController(alertController, animated: true) { () -> Void in
            
        }
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let itemTableViewController = storyboard?.instantiateViewControllerWithIdentifier("itemInListVC") as! itemsInListVC
        
        itemTableViewController.currentList = packLists[indexPath.row]
        
        navigationController?.pushViewController(itemTableViewController, animated: true)
        
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            packLists.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}