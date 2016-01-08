//
//  itemsInListVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 20.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation

class itemsInListVC : UITableViewController {
    
    var items = [String]()
    var kategory = [String]()
    let resizingMask = UIViewAutoresizing.FlexibleWidth
    
   
    var currentList = ""
    override func viewDidLoad() {
         self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        title = currentList
        kategory = ["Bekleidung", "Elektronik", "Dokumente","Kosmetik",
            "Sport", "Reiseapotheke","Grundausstattung", "Sonstiges"]
        items = ["Hose","Schuhe","usw"]
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.autoresizingMask = resizingMask
        backgroundView.addSubview(self.buildImageView())
        
       // tableView.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 0.5)
        
        tableView.backgroundView = backgroundView
        
      //  tableView.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 0.5)
    }
    func buildImageView() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "light_background_2"))
        imageView.frame = view.bounds
        imageView.autoresizingMask = resizingMask
        return imageView
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return kategory.count
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return kategory[section]
    }
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 1.0) //make the background color light blue
        header.textLabel!.textColor = UIColor.whiteColor() //make the text white
        header.textLabel?.textAlignment = .Center
        
        // header.alpha = 0.5 //make the header transparent
        //header.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 0.5)
       
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.tintColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.clearColor()
        cell.contentView.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 0.5)

   //     cell.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 0.5)
        // cell.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 0.5)
        
       // cell.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 0.5)
        
        return cell
    }
    @IBAction func addElements(sender: AnyObject) {
        let itemTableViewController = storyboard?.instantiateViewControllerWithIdentifier("addItemsVC") as! addItemsVC
        navigationController?.pushViewController(itemTableViewController, animated: true)
        
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}