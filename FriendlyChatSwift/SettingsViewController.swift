//
//  SettingsViewController.swift
//  FriendlyChatSwift
//
//  Created by Kero on 2016/12/1.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var heightButton: UIButton!
    @IBOutlet weak var trainSwitch: UISwitch!
    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var dailyGoal = 1500
    
    
    enum pickerName{
        case height
        case weight
    }
    
    var currentPicker = pickerName.height
    
    let weightArray = Array(30...199)
    let heightArray = Array(100...200)
    
    @IBAction func weightBtnAction(sender: UIButton) {
        currentPicker = .weight
        pickerView.reloadAllComponents()
        pickerView.selectRow(20, inComponent: 0, animated: false)
        animateIn()
    }
    
    @IBAction func heightBtnAction(sender: UIButton) {
        currentPicker  = .height
        pickerView.reloadAllComponents()
        pickerView.selectRow(50, inComponent: 0, animated: false)
        animateIn()
    }
    
    @IBAction func switchAction(sender: UISwitch) {
    }
    
    @IBAction func sliderAction(sender: UISlider) {
        dailyGoal = Int(sender.value)
        goalLabel.text = String(Int(sender.value)) + "ml"
    }
    
    @IBAction func doneBtnAction(sender: UIButton) {
        animateOut()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        goalLabel.text = String(dailyGoal) + "ml"
        popUpView.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
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
