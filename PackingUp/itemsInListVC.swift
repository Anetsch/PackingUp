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
    let resizingMask = UIViewAutoresizing.FlexibleWidth
    
    var currentList = ""
    override func viewDidLoad() {
         self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        title = currentList
        
        items = ["Hose","Schuhe","usw"]
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.autoresizingMask = resizingMask
        backgroundView.addSubview(self.buildImageView())
       
        
        tableView.backgroundView = backgroundView
    }
    func buildImageView() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "light_background_2"))
        imageView.frame = view.bounds
        imageView.autoresizingMask = resizingMask
        return imageView
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    @IBAction func addElements(sender: AnyObject) {
        let itemTableViewController = storyboard?.instantiateViewControllerWithIdentifier("addItemsVC") as! addItemsVC
        
        
        navigationController?.pushViewController(itemTableViewController, animated: true)
        
    }
}