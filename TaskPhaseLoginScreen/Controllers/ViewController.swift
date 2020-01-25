//
//  ViewController.swift
//  TaskPhaseLoginScreen
//
//  Created by Sukidhar Darisi on 24/01/20.
//  Copyright © 2020 Sukidhar Darisi. All rights reserved.
//
import SkyFloatingLabelTextField
import TKSubmitTransition
import UIKit


class LSViewController: UIViewController {
    
    let imgSrc = [#imageLiteral(resourceName: "Sleepy"),#imageLiteral(resourceName: "Hehe"),#imageLiteral(resourceName: "smiling-face-with-open-mouth-and-smiling-eyes_1f604.png"),#imageLiteral(resourceName: "LOL"),#imageLiteral(resourceName: "Curious"),#imageLiteral(resourceName: "smiling-face-with-heart-shaped-eyes_1f60d"),#imageLiteral(resourceName: "Smiley"),#imageLiteral(resourceName: "face-with-finger-covering-closed-lips_1f92b"),#imageLiteral(resourceName: "Liar")]
    
    @IBOutlet weak var signInButton: TKTransitionSubmitButton!
    
    @IBOutlet weak var avatarView: UIImageView!
    
    @IBOutlet weak var userNameTextField: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var passwordTextFIELD: SkyFloatingLabelTextFieldWithIcon!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signInButton.layer.cornerRadius = signInButton.frame.height/2
        signInButton.clipsToBounds = true
                
    }

    
    @IBAction func signInPressed(_ sender: TKTransitionSubmitButton) {
    
        sender.startLoadingAnimation();
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        signInButton.startFinishAnimation(5.0) {
            print("Detail View Controller")
        }
    }
}
