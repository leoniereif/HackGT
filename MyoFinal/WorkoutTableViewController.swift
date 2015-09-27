//
//  WorkoutTableViewController.swift
//  MyoFitness
//
//  Created by Leonie Reif on 25/09/15.
//  Copyright © 2015 Leonie Reif. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    
    let myWorkoutList = WorkoutList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.editing = false
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myWorkoutList.workouts.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        cell.accessoryType = .Checkmark
        let item = myWorkoutList.workouts[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Burns " + "\(item.calories)" + " calories"
        let txtField: UITextField = UITextField(frame: CGRect(x: 260, y: 17, width: 40.00, height: 20.00));
        txtField.text = "10"
        cell.contentView.addSubview(txtField)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let tf = cell?.contentView.subviews[2] as! UITextField
        if cell!.accessoryType == UITableViewCellAccessoryType.Checkmark {
            cell?.accessoryType = .None
            tf.text = ""
            tf.enabled = false
        } else {
            cell?.accessoryType = .Checkmark
            tf.text = "10"
            tf.enabled = true
        }
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true // Yes, the table view can be reordered
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let movedObject = myWorkoutList.workouts[sourceIndexPath.row]
        myWorkoutList.workouts.removeAtIndex(sourceIndexPath.row)
        myWorkoutList.workouts.insert(movedObject, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func edit(sender: AnyObject) {
        
        if(self.editing) {
            
            navigationItem.rightBarButtonItem?.title = ""
            
            for (var row = 0; row < tableView.numberOfRowsInSection(0); row++) {
                let tf = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0))?.contentView.subviews[2] as! UITextField
                tf.enabled = false
                tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0))?.accessoryType = .None
                tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0))?.userInteractionEnabled = false
            }
            super.setEditing(false, animated: false)
            
        } else {
            
            navigationItem.title = "Edit Order"
            //don't display unchecked
            for (var row = 0; row < tableView.numberOfRowsInSection(0); row++) {
                let tf = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0))?.contentView.subviews[2] as! UITextField
                tf.enabled = false
                if(tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0))?.accessoryType == UITableViewCellAccessoryType.None) {
                    myWorkoutList.workouts.removeAtIndex(row)
                    tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: row, inSection: 0)], withRowAnimation: .Fade)
                }
            }
            navigationItem.rightBarButtonItem?.title = "Done"
            super.setEditing(true, animated: true)
            
        }
    }
    
    func highlightCell (row: Int) {
        let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0))
        cell!.layer.borderWidth = 2.0
        cell!.layer.borderColor = UIColor.grayColor().CGColor
    }
    
    func isActive (row: Int) {
        //countdown
        //
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    /*@IBAction func ConnectMyo(sender: UIBarButtonItem) {
            let controller: UINavigationController = TLMSettingsViewController.settingsInNavigationController()
            
            self.presentViewController(controller, animated: true, completion: nil)
    }*/
    
}
