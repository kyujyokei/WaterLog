//
//  CustomSegue.swift
//  FriendlyChatSwift
//
//  Created by Kero on 2016/11/24.
//  Copyright © 2016年 Google Inc. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        
        //credits to http://www.appcoda.com/custom-segue-animations/
        
        let firstClassView = self.sourceViewController.view
        let secondClassView = self.destinationViewController.view
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        secondClassView.frame = CGRectMake(screenWidth, 0, screenWidth, screenHeight)
        
        if let window = UIApplication.sharedApplication().keyWindow {
            
            window.insertSubview(secondClassView, aboveSubview: firstClassView)
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                firstClassView.frame = CGRectOffset(firstClassView.frame, -screenWidth, 0)
                secondClassView.frame = CGRectOffset(secondClassView.frame, -screenWidth, 0)
                
            }) {(Finished) -> Void in
                
                self.sourceViewController.navigationController?.pushViewController(self.destinationViewController, animated: false)
                
            }
            
        }
        
    }

}
