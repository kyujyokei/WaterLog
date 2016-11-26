//
//  AlarmViewController.swift
//  FriendlyChatSwift
//
//  Created by Kero on 2016/11/26.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var customButton: UIButton!
    
    
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var endButton: UIButton!
    
    @IBOutlet weak var intervalButton: UIButton!
    
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
    }
    
    @IBAction func endBtnAction(sender: UIButton) {
    }
    
    @IBAction func intervalBtnAction(sender: UIButton) {
    }
    
    @IBOutlet weak var alarmTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmSwitch.on = false

        startLabel.textColor = UIColor.grayColor()
        endLabel.textColor = UIColor.grayColor()
        intervalLabel.textColor = UIColor.grayColor()
        customLabel.textColor = UIColor.grayColor()
        
        startButton.enabled = false
        endButton.enabled = false
        intervalButton.enabled = false
        customButton.enabled = false
        
        alarmSwitch.onTintColor = UIColor.blueColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
