//
//  Copyright (c) 2015 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

/**********
 TODO:
 
 1. Set authentication methods for users to sign in 
 
 *********/

import UIKit

import Firebase

@objc(SignInViewController)
class SignInViewController: UIViewController {

  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

  override func viewDidAppear(animated: Bool) {
    
    self.navigationController?.setNavigationBarHidden(true, animated: true)
    
    //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"logbg")!)
    let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
    backgroundImage.image = UIImage(named: "logbg.png")
    self.view.insertSubview(backgroundImage, atIndex: 0)
    if let user = FIRAuth.auth()?.currentUser {
      self.signedIn(user)
    }
    emailField.text = "kyujyokei@gmail.com"
    passwordField.text = "effort"
    
    signInButton.layer.cornerRadius = signInButton.frame.height/2
    signInButton.backgroundColor = UIColor.clearColor()
    signInButton.layer.borderWidth = 1
    signInButton.layer.borderColor = UIColor.whiteColor().CGColor
    
    
  }

  @IBAction func didTapSignIn(sender: AnyObject) {
    // Sign In with credentials.
//    let email = emailField.text
//    let password = passwordField.text
//    FIRAuth.auth()?.signInWithEmail(email!, password: password!) { (user, error) in
//      if let error = error {
//        print(error.localizedDescription)
//        return
//      }
//      self.signedIn(user!)
//    }
    performSegueWithIdentifier(Constants.Segues.SignInToFp, sender: nil)
  }
    
  @IBAction func didTapSignUp(sender: AnyObject) {
    let email = emailField.text
    let password = passwordField.text
    FIRAuth.auth()?.createUserWithEmail(email!, password: password!) { (user, error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      self.setDisplayName(user!)
    }
  }

  func setDisplayName(user: FIRUser) {
    let changeRequest = user.profileChangeRequest()
    changeRequest.displayName = user.email!.componentsSeparatedByString("@")[0]
    changeRequest.commitChangesWithCompletion(){ (error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }
      self.signedIn(FIRAuth.auth()?.currentUser)
    }
  }

  @IBAction func didRequestPasswordReset(sender: AnyObject) {
    let prompt = UIAlertController.init(title: nil, message: "Email:", preferredStyle: UIAlertControllerStyle.Alert)
    let okAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.Default) { (action) in
      let userInput = prompt.textFields![0].text
      if (userInput!.isEmpty) {
        return
      }
      FIRAuth.auth()?.sendPasswordResetWithEmail(userInput!) { (error) in
        if let error = error {
          print(error.localizedDescription)
          return
        }
      }
    }
    prompt.addTextFieldWithConfigurationHandler(nil)
    prompt.addAction(okAction)
    presentViewController(prompt, animated: true, completion: nil);
  }

  func signedIn(user: FIRUser?) {
    MeasurementHelper.sendLoginEvent()

    AppState.sharedInstance.displayName = user?.displayName ?? user?.email
    AppState.sharedInstance.photoUrl = user?.photoURL
    AppState.sharedInstance.signedIn = true
    NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKeys.SignedIn, object: nil, userInfo: nil)
    performSegueWithIdentifier(Constants.Segues.SignInToFp, sender: nil)
  }
    
    
    
}


