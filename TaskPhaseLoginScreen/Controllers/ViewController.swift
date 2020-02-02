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
    
    let altUserName = "sukidhar"
    let crctUserName = "sukidhar@gmail.com"
    let crctPassWord = "Suki1329"
    let imgSrc = [#imageLiteral(resourceName: "Sleepy"),#imageLiteral(resourceName: "Hehe"),#imageLiteral(resourceName: "smiling-face-with-open-mouth-and-smiling-eyes_1f604.png"),#imageLiteral(resourceName: "LOL"),#imageLiteral(resourceName: "YAY.png"),#imageLiteral(resourceName: "Curious"),#imageLiteral(resourceName: "smiling-face-with-heart-shaped-eyes_1f60d"),#imageLiteral(resourceName: "Smiley"),#imageLiteral(resourceName: "face-with-finger-covering-closed-lips_1f92b"),#imageLiteral(resourceName: "Liar")]
    
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
    
    
    @IBAction func editingStarted(_ sender: SkyFloatingLabelTextField) {
        
        userNameTextField.errorMessage = ""
        if let text = sender.text{
            
            if !text.contains("@") {
                switch text.count {
                case 0:
                    avatarView.image = imgSrc[0]
                    break
                case 1:
                    avatarView.image = imgSrc[1]
                    break
                case 3:
                    avatarView.image = imgSrc[2]
                    break
                case 5:
                    avatarView.image = imgSrc[3]
                    break
                case 7:
                    avatarView.image = imgSrc[4]
                    break
                default:
                    print("Too Long LOL")
                }
            }
            else{
                avatarView.image = imgSrc[5]
                if(text.contains(".")){
                    avatarView.image = imgSrc[6]
                    if(text.hasSuffix(".com")){
                        avatarView.image = imgSrc[7]
                    }
                }
            }
        }
    }
    
    @IBAction func passwordBeingTyped(_ sender: SkyFloatingLabelTextField) {
        
        passwordTextFIELD.errorMessage = ""
        
        if let text = passwordTextFIELD.text{
            
            if(text.count == 0){
                avatarView.image = imgSrc[0]
            }
            else{
                avatarView.image = imgSrc[8]
            }
        }
    }
    
    
    
    @IBAction func signInPressed(_ sender: TKTransitionSubmitButton) {
        
        sender.startLoadingAnimation();
        
        if let text = userNameTextField.text{
            
            if let ptext = passwordTextFIELD.text{
                
                let c1 = (crctUserName == text.lowercased() || altUserName == text.lowercased())
                let c2 = crctPassWord == ptext
                if c1 && c2 {
                    signInButton.startFinishAnimation(1.5) {
                        self.performSegue(withIdentifier: "DetailView", sender: self)
                    }
                }
                else{
                    if !c1{
                        signInButton.startFinishAnimation(0.5) {
                            print("Error Occured")
                        }
                        userNameTextField.errorMessage = "Invaild Email or UserName"
                        userNameTextField.errorColor = #colorLiteral(red: 1, green: 0, blue: 0.09259407967, alpha: 1)
                    }
                    else{
                        signInButton.startFinishAnimation(0.5) {
                            print("Error Occured")
                        }
                        passwordTextFIELD.errorColor = #colorLiteral(red: 1, green: 0, blue: 0.09259407967, alpha: 1)
                        passwordTextFIELD.errorMessage  = "Invalid Password"
                    }
                }
            }
        }
    }
}
