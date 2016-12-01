//
//  AlarmViewController.swift
//  FriendlyChatSwift
//
//  Created by Kero on 2016/11/26.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController, UIPickerViewDataSource {
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect :UIVisualEffect!
    
    @IBOutlet var datePickerView: UIDatePicker!
    
    @IBOutlet var PopUpView: UIView!
    
    @IBAction func timeDoneBtnAction(sender: UIButton) {
        animateOut("start")
    }
    
    @IBAction func intervalDoneBtnAction(sender: UIButton) {
        animateOut("interval")
    }

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
        animateIn("start")
    }
    
    @IBAction func endBtnAction(sender: UIButton) {
        animateIn("end")
    }
    
    @IBAction func intervalBtnAction(sender: UIButton) {
        animateIn("interval")
    }
    
    @IBOutlet weak var alarmTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        PopUpView.layer.cornerRadius = 5
        
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
    
    func animateIn(viewName:String){
        if viewName == "start" || viewName == "end"  {
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
        } else if viewName == "interval"  {
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
            
            self.visualEffectView.effect = nil
            self.visualEffectView.alpha = 0
            
            if viewName == "start" || viewName == "end" {
            
                self.PopUpView.transform = CGAffineTransformMakeScale(1.3, 1.3)
                self.PopUpView.alpha = 0
                self.PopUpView.removeFromSuperview()
            } else if viewName == "interval"{
                
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
        return 5
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
