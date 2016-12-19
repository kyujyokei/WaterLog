//
//  settingsTableViewController.swift
//  FriendlyChatSwift
//
//  Created by Kero on 2016/11/27.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

/**********
 TODO:
 
 Create NSUserData for storing settings
 
 *********/

import UIKit

class settingsTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    enum pickerName{
        case height
        case weight
    }
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var weightDetailLabel: UILabel!
    @IBOutlet weak var heightDetailLabel: UILabel!
    var currentPicker = pickerName.height
    
    let weightArray = Array(30...199)
    let heightArray = Array(100...200)
    
    @IBAction func doneButton(sender: UIButton) {
        animateOut()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.allowsSelection = false
        
        
        print(weightArray[30])
        print(heightArray[100])
        
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentPicker == .weight {
            return weightArray.count
        } else {
            return heightArray.count
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentPicker == .weight {
            return String(weightArray[row])
        } else {
            return String(self.heightArray[row])
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //tableView.deselectRowAtIndexPath(indexPath, animated: true) //so cell wont turn grey when selected
        
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                //show weight picker
                animateIn()
                currentPicker = .weight
                pickerView.reloadAllComponents()
                pickerView.selectRow(20, inComponent: 0, animated: true)
            
            } else if indexPath.row == 1 {
                //show height picker
                animateIn()
                currentPicker = .height
                pickerView.reloadAllComponents()
                pickerView.selectRow(50, inComponent: 0, animated: true)
            }
        }
    }
    
    func animateIn(){
        
            //if the view is for setting start or end time
            self.view.addSubview(popUpView)
            popUpView.center = self.view.center
            
            popUpView.transform = CGAffineTransformMakeScale(1.3, 1.3)
            popUpView.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: {
//                self.visualEffectView.effect = self.effect
//                self.visualEffectView.alpha = 1
                self.popUpView.alpha = 1
                self.popUpView.transform = CGAffineTransformIdentity
                
//                let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
//                let blurEffectView = UIVisualEffectView(effect: blurEffect)
//                blurEffectView.frame = self.view.bounds
//                blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//                self.view.addSubview(blurEffectView)
                
            })
        
    }
    
    func animateOut(){
        
        UIView.animateWithDuration(0.3, animations: {
            
//            self.visualEffectView.effect = nil
//            self.visualEffectView.alpha = 0

                self.popUpView.transform = CGAffineTransformMakeScale(1.3, 1.3)
                self.popUpView.alpha = 0
                self.popUpView.removeFromSuperview()
            
        })
        //        { (sucess:Bool)in
        //            self.PopUpView.removeFromSuperview()
        //        }
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
