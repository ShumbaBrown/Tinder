//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Shumba Brown on 4/3/17.
//  Copyright © 2017 Shumba Brown. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    
    var profileImage: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if profileImage != nil {
            profileImageView.image = profileImage
        }
        // Do any additional setup after loading the view.
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
