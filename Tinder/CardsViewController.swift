//
//  CardsViewController.swift
//  Tinder
//
//  Created by Shumba Brown on 4/3/17.
//  Copyright © 2017 Shumba Brown. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var actionButton: UIImage = #imageLiteral(resourceName: "action_buttons")
    var navBar: UIImage = #imageLiteral(resourceName: "nav_bar")
    
    @IBOutlet var navBarImageView: UIImageView!
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var actionImageView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        
        navBarImageView.image = navBar
        actionImageView.image = actionButton
        cardImageView.image = #imageLiteral(resourceName: "ryan")
        
        cardInitialCenter = cardImageView.center
        //CGPoint(x: self.cardImageView.center.x + translation.x, y: self.newFaceOriginalCenter.y + translation.y)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(sender:)))
        
        // Optionally set the number of required taps, e.g., 2 for a double click
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        cardImageView.isUserInteractionEnabled = true
        cardImageView.addGestureRecognizer(panGestureRecognizer)
        cardImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func didPan(sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
        } else if sender.state == .changed {
            
            
            if translation.x > 0 {
                cardImageView.center = CGPoint(x: self.cardInitialCenter.x + translation.x ,y: self.cardInitialCenter.y)
                cardImageView.transform = cardImageView.transform.rotated(by:0.003)
                
            }
            else if translation.x < 0 {
                cardImageView.center = CGPoint(x: self.cardInitialCenter.x + translation.x ,y: self.cardInitialCenter.y)
                cardImageView.transform = cardImageView.transform.rotated(by:-0.003)
            }
            
            
            
            print("Gesture is changing")
        } else if sender.state == .ended {
            print("Gesture ended")
            
            if translation.x > 50 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.cardImageView.center = CGPoint(x: self.cardInitialCenter.x + 500 ,y: self.cardInitialCenter.y)
                })
            }
            else if translation.x < -50 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.cardImageView.center = CGPoint(x: self.cardInitialCenter.x - 500 ,y: self.cardInitialCenter.y)
                })
            }
            else {
                cardImageView.center = cardInitialCenter
                cardImageView.transform = CGAffineTransform.identity
            }
        }
    }
    func onTap(sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "openProfile", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProfileViewController
        
        vc.profileImage = self.cardImageView.image
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
