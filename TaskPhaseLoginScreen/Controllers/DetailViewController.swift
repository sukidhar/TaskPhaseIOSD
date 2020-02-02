//
//  DetailViewController.swift
//  TaskPhaseLoginScreen
//
//  Created by Sukidhar Darisi on 25/01/20.
//  Copyright © 2020 Sukidhar Darisi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageview.image = #imageLiteral(resourceName: "User")
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        imageview.layer.cornerRadius = 20
        imageview.layer.masksToBounds = true
        containView.addSubview(imageview)
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.title = "Profile"
    }
    
    @IBAction func mobileNumberPressed(_ sender: UIButton) {
        guard let number = URL(string: "tel://"+"+8008874447") else {
            return
        }
        UIApplication.shared.open(number)
    }
    @IBAction func logOutPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
