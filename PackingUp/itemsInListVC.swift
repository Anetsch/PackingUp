//
//  itemsInListVC.swift
//  PackingUp
//
//  Created by Philipp Winterholler  on 20.12.15.
//  Copyright © 2015 Andreas Netsch. All rights reserved.
//

import Foundation

class itemsInListVC : UITableViewController {
    
    var itemsBekleidung = [String]()
    var itemsElektronik = [String]()
    var itemsDokumente = [String]()
    var itemsKosmetik = [String]()
    var itemsSport = [String]()
    var itemsReiseapotheke = [String]()
    var itemsGrundausstattung = [String]()
    var itemsSonstiges = [String]()
    
    var kategory = [String]()
    let resizingMask = UIViewAutoresizing.FlexibleWidth
    
    
   
    var currentList = ""
    override func viewDidLoad() {
         self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        title = currentList
        kategory = ["Bekleidung", "Elektronik", "Dokumente","Kosmetik",
            "Sport", "Reiseapotheke","Grundausstattung", "Sonstiges"]
        itemsBekleidung  = ["Hose","Schuhe","usw"]
        itemsElektronik = ["Smartphone","Ladekabel","Föhn"]
        itemsDokumente = ["Smartphone","Ladekabel","Föhn"]
        itemsKosmetik = ["Zahnbürste","Zahncreme","Nagelschere","Brille","Hautcreme"]
        itemsSport = ["Sportschuhe"]
        itemsReiseapotheke = ["Aspirin","Autan"]
        itemsGrundausstattung = ["Feuerzeug","Ladekabel","Föhn"]
        itemsSonstiges = ["Kugelschreiber"]
//        items = ["Hose","Schuhe","usw"]
//        items = ["Hose","Schuhe","usw"]
        
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
        header.contentView.backgroundColor = UIColor(red: 74.0/255, green: 100.0/255, blue: 97.0/255, alpha: 1.0)
 //make the background color light blue
       // header.textLabel!.textColor = UIColor(red: 58.0/255, green: 80.0/255, blue: 94.0/255, alpha: 1.0)
        
        header.textLabel!.textColor = UIColor.whiteColor() //make the text white
        header.textLabel?.textAlignment = .Center
        
        // header.alpha = 0.5 //make the header transparent
        //header.backgroundColor = UIColor(red: 160.0/255, green: 198.0/255, blue: 55.0/255, alpha: 0.5)
       
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return itemsBekleidung.count
        } else if section == 1 {
            return itemsDokumente.count
        } else if section == 2 {
            return itemsKosmetik.count
        } else if section == 3 {
            return itemsSport.count
        } else if section == 4 {
            return itemsReiseapotheke.count
        } else if section == 5 {
            return itemsGrundausstattung.count
        } else if section == 6 {
            return itemsSonstiges.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath)
        //cell.imageView?.image = UIImage(named: "Kreis_1")
        
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.tintColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.clearColor()
        cell.contentView.backgroundColor = UIColor(red: 136.0/255, green: 170.0/255, blue: 78.0/255, alpha: 0.3)
        let diceRoll = Int(arc4random_uniform(6) + 1)
        
        cell.detailTextLabel?.text = "\(diceRoll) x"
        
        let cellImage : UIImage = UIImage(named: "Kreis_Klein")!

        cell.sizeToFit()
        cell.clipsToBounds = true;
        cell.imageView?.image = cellImage
        
        if indexPath.section == 0 {
            cell.textLabel?.text = itemsBekleidung[indexPath.row]
            
        } else if indexPath.section == 1 {
            cell.textLabel?.text = itemsDokumente[indexPath.row]
        } else if indexPath.section == 2 {
            cell.textLabel?.text = itemsKosmetik[indexPath.row]
        } else if indexPath.section == 3 {
            cell.textLabel?.text = itemsSport[indexPath.row]
        } else if indexPath.section == 4 {
            cell.textLabel?.text = itemsReiseapotheke[indexPath.row]
        } else if indexPath.section == 5 {
            cell.textLabel?.text = itemsGrundausstattung[indexPath.row]
        } else if indexPath.section == 6 {
            cell.textLabel?.text = itemsSonstiges[indexPath.row]
        }

        
        return cell
    }
    @IBAction func addElements(sender: AnyObject) {
        let itemTableViewController = storyboard?.instantiateViewControllerWithIdentifier("addItemsVC") as! addItemsVC
        navigationController?.pushViewController(itemTableViewController, animated: true)
        
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if indexPath.section == 0 {
                itemsBekleidung.removeAtIndex(indexPath.row)
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        cell?.imageView?.image = UIImage(named: "HakenMitKreis")
    }
}