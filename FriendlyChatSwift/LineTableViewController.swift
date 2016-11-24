//
//  LineTableViewController.swift
//  FriendlyChatSwift
//
//  Created by Kero on 2016/11/24.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

import UIKit

class LineTableViewController: UIViewController {
    
    let cancelImage = UIImage(named: "cancel.png")
    
    @IBAction func cancelButtonAction(sender: UIButton) {
        print("AAA")
    }

    
    
//    var Abutton = UIButton(frame: CGRect(x: 20, y: 20, width: 35, height: 35))
    
//    func Tapped(sender: UIButton!) {
//        print("Button tapped");
//        //self.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Abutton.backgroundColor = UIColor.clearColor()
//        Abutton.setTitle("", forState: UIControlState.Normal)
//        Abutton.setImage(cancelImage, forState: .Normal)
//        Abutton.addTarget(self, action: #selector(Tapped), forControlEvents: .TouchUpInside)
//        self.view.addSubview(Abutton)
        
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
