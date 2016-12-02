//
//  AlarmViewController.swift
//  FriendlyChatSwift
//
//  Created by Kero on 2016/11/26.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var timeIntervalView: UIView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var intervalButton: UIButton!
    
    enum popUpName{
        case interval
        case start
        case end
        case custom
    }
    
    let timeIntervals = ["1 hour","2 hours","3 hours","4 hours"]
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect :UIVisualEffect!
    var currentPopUpView = popUpName.start
    var customDateArray = [NSDate]()
    
    @IBOutlet var datePickerView: UIDatePicker!
    
    @IBOutlet var PopUpView: UIView!
    
    @IBAction func timeDoneBtnAction(sender: UIButton) {
        animateOut("start")
    }
    
    @IBAction func intervalDoneBtnAction(sender: UIButton) {
        animateOut("interval")
    }
    
    @IBAction func datePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        //dateFormatter.timeStyle = .ShortStyle
        
        let strDate = dateFormatter.stringFromDate(datePickerView.date)
        if currentPopUpView == .start {
            startButton.setTitle(strDate, forState: .Normal)
        } else if currentPopUpView == .end {
            endButton.setTitle(strDate, forState: .Normal)
        } else if currentPopUpView == .custom{
            
        }
        
    }
    
    @IBAction func alarmSwitchAction(sender: UISwitch) {
        
        if alarmSwitch.on == true {
            startLabel.textColor = UIColor.blackColor()
            endLabel.textColor = UIColor.blackColor()
            intervalLabel.textColor = UIColor.blackColor()
            customLabel.textColor = UIColor.blackColor()
            
            startButton.enabled = true
            endButton.enabled = true
            intervalButton.enabled = true
            customButton.enabled = true
        } else {
            startLabel.textColor = UIColor.grayColor()
            endLabel.textColor = UIColor.grayColor()
            intervalLabel.textColor = UIColor.grayColor()
            customLabel.textColor = UIColor.grayColor()
            
            startButton.enabled = false
            endButton.enabled = false
            intervalButton.enabled = false
            customButton.enabled = false
        }
    }
    
    @IBAction func backBtnAction(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func startBtnAction(sender: UIButton) {
        currentPopUpView = .start
        animateIn()
    }
    
    @IBAction func endBtnAction(sender: UIButton) {
        currentPopUpView = .end
        animateIn()
    }
    
    @IBAction func intervalBtnAction(sender: UIButton) {
        currentPopUpView = .interval
        animateIn()
    }
    
    @IBAction func customBtnAction(sender: UIButton) {
        currentPopUpView = .custom
        animateIn()
    }
    
    
    @IBOutlet weak var alarmTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        PopUpView.layer.cornerRadius = 5
        
        alarmSwitch.on = false
        alarmSwitch.onTintColor = waterColor
        //alarmSwitch.backgroundColor = waterColor
        //alarmSwitch.tintColor = waterColor

        startLabel.textColor = UIColor.grayColor()
        endLabel.textColor = UIColor.grayColor()
        intervalLabel.textColor = UIColor.grayColor()
        customLabel.textColor = UIColor.grayColor()
        
        startButton.enabled = false
        endButton.enabled = false
        intervalButton.enabled = false
        customButton.enabled = false
        
        alarmTableView.tableFooterView = UIView()
        
    }
    
    func animateIn(){
        if currentPopUpView == .start || currentPopUpView == .end || currentPopUpView == .custom {
        //if the view is for setting start or end time
            self.view.addSubview(PopUpView)
            PopUpView.center = self.view.center
            
            PopUpView.transform = CGAffineTransformMakeScale(1.3, 1.3)
            PopUpView.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: {
                self.visualEffectView.effect = self.effect
                self.visualEffectView.alpha = 1
                self.PopUpView.alpha = 1
                self.PopUpView.transform = CGAffineTransformIdentity
            })
        } else if currentPopUpView == .interval {
        //if the view is for setting time interval
            self.view.addSubview(timeIntervalView)
            timeIntervalView.center = self.view.center
            
            timeIntervalView.transform = CGAffineTransformMakeScale(1.3, 1.3)
            timeIntervalView.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: {
                self.visualEffectView.effect = self.effect
                self.visualEffectView.alpha = 1
                self.timeIntervalView.alpha = 1
                self.timeIntervalView.transform = CGAffineTransformIdentity
            })

        }
    }

    func animateOut(viewName:String){
       
        UIView.animateWithDuration(0.3, animations: {
            
            if self.currentPopUpView == .custom{
                self.customDateArray.append(self.datePickerView.date)
                self.alarmTableView.reloadData()
            }
            //print(self.customDateArray)
            self.visualEffectView.effect = nil
            self.visualEffectView.alpha = 0
            
            if self.currentPopUpView == .start || self.currentPopUpView == .end || self.currentPopUpView == .custom{
            
                self.PopUpView.transform = CGAffineTransformMakeScale(1.3, 1.3)
                self.PopUpView.alpha = 0
                self.PopUpView.removeFromSuperview()
            } else if self.currentPopUpView == .interval {
                
                self.timeIntervalView.transform = CGAffineTransformMakeScale(1.3, 1.3)
                self.timeIntervalView.alpha = 0
                self.timeIntervalView.removeFromSuperview()
            
            }

        })
       //        { (sucess:Bool)in
//            self.PopUpView.removeFromSuperview()
//        }
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeIntervals[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        intervalButton.setTitle(timeIntervals[row], forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customDateArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TimeListCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let strDate = dateFormatter.stringFromDate(customDateArray[indexPath.row])
        cell.textLabel?.text = "\(strDate)"
        cell.textLabel?.font = UIFont (name: "Roboto-Light", size: 16)
        return cell
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            customDateArray.removeAtIndex(indexPath.row)
            alarmTableView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
